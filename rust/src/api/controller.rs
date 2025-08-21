use std::{
    sync::{mpsc, Arc, Mutex},
    time::Duration,
};

use flutter_rust_bridge::frb;

// InnerController represent an object consumed from an external library
#[frb(ignore)]
pub struct InnerController {
    balance: Arc<Mutex<u32>>,
    sender: mpsc::Sender<()>,
    receiver: Option<mpsc::Receiver<()>>,
}

// getters
#[frb(ignore)]
impl InnerController {
    pub fn balance(&self) -> u32 {
        *self.balance.lock().expect("poisoned")
    }
}

// public methods
// #[frb(ignore)]
impl InnerController {
    #[allow(clippy::new_without_default)]
    pub fn new() -> Self {
        let (sender, receiver) = mpsc::channel();
        let balance = Arc::new(Mutex::new(0));
        Self {
            balance,
            sender,
            receiver: Some(receiver),
        }
    }
    // short lived method
    #[frb(ignore)]
    pub fn spend_coin(&mut self) {
        let mut balance = self.balance.lock().expect("poisoned");
        *balance = balance.saturating_sub(1);

        let _ = self.sender.send(());
    }
    // long lived method
    #[frb(ignore)]
    pub fn receive_coins(&mut self) {
        let sender = self.sender.clone();
        let balance = self.balance.clone();
        std::thread::spawn(move || {
            for _ in 0..10 {
                std::thread::sleep(Duration::from_millis(500));
                *balance.lock().expect("poisoned") += 1;
                let _ = sender.send(());
            }
        });
    }
    // notification poller (non blocking)
    #[frb(ignore)]
    pub fn try_poll(&mut self) -> Option<()> {
        self.receiver
            .as_ref()
            .map(|recv| recv.try_recv().ok())
            .flatten()
    }
    // receiver taker, can be used for blocking poll
    #[frb(ignore)]
    pub fn take_receiver(&mut self) -> Option<mpsc::Receiver<()>> {
        self.receiver.take()
    }
}
