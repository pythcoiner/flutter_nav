// extern "Rust" {
//     #[rust_name = Config]
//     type RustConfig;
//     fn electrum_url(&self) -> String;
//     fn electrum_port(&self) -> String;
//     fn nostr_url(&self) -> String;
//     fn nostr_back(&self) -> String;
//     fn look_ahead(&self) -> String;
//     fn network(&self) -> Network;
//     fn set_electrum_url(&mut self, url: String);
//     fn set_electrum_port(&mut self, port: String);
//     fn set_nostr_relay(&mut self, relay: String);
//     fn set_nostr_back(&mut self, back: String);
//     fn set_look_ahead(&mut self, look_ahead: String);
//     fn set_network(&mut self, network: Network);
//     fn set_mnemonic(&mut self, mnemonic: String);
//     fn to_file(&self);
//     fn config_from_file(account: String) -> Box<Config>;
//     fn config_exists(account: String) -> bool;
//     fn set_account(&mut self, name: String);
//     fn is_descriptor_valid(descriptor: String) -> bool;
//     fn new_config(mnemonic: String, account: String, network: Network) -> Box<Config>;
// }

pub struct Config {}
