use flutter_rust_bridge::frb;
use lazy_static::lazy_static;
use std::sync::{Arc, Mutex};

use crate::frb_generated::StreamSink;

use super::controller::InnerController;

#[frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}

lazy_static! {
    #[frb(ignore)]
    pub static ref CTRL: Mutex<Option<InnerController>> = Mutex::new(None);
    #[frb(ignore)]
    pub static ref SINK: Mutex<Option<StreamSink<u32>>> = Mutex::new(None);
}

macro_rules! get {
    ($state:ident) => {
        $state
            .lock()
            .expect("poisoned")
            .as_mut()
            .expect("initialized")
    };
}

// // NOTE: ALL fields MUST be public to auto implement SseEncode
// pub struct Counters {
//     pub count: u32,
//     pub looper: u32,
// }

#[frb(opaque)]
pub struct RController {
    balance: Arc<Mutex<u32>>,
}

impl RController {
    #[allow(clippy::new_without_default)]
    #[frb(sync)]
    pub fn new() -> Self {
        Self {
            balance: Arc::new(Mutex::new(0)),
        }
    }
    #[frb(sync)]
    pub fn init() {
        let mut ctrl = CTRL.lock().expect("poisoned");
        assert!(ctrl.is_none());
        *ctrl = Some(InnerController::new());
    }
    #[frb(sync)]
    pub fn listen(&self, sink: StreamSink<u32>) {
        // take the receiver
        let receiver = get!(CTRL).take_receiver().expect("have a receiver");

        // initialize the StreamSink
        let mut ss = SINK.lock().expect("poisoned");
        assert!(ss.is_none());
        *ss = Some(sink);
        drop(ss);

        let balance = self.balance.clone();

        // Listen
        std::thread::Builder::new()
            .stack_size(32 * 1024)
            .spawn(move || loop {
                // update the balance when we get a notif
                receiver.recv().expect("stopped");
                let updated_balance = get!(CTRL).balance();
                *balance.lock().expect("poisoned") = updated_balance;
                let _ = get!(SINK).add(updated_balance);
            })
            .expect("fail to spawn");
    }
    #[frb(sync)]
    pub fn balance(&self) -> u32 {
        *self.balance.lock().expect("poisoned")
    }
    #[frb(sync)]
    pub fn spend() {
        get!(CTRL).spend_coin();
    }
    #[frb(sync)]
    pub fn receive() {
        get!(CTRL).receive_coins();
    }
}
