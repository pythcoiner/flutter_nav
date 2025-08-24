class WalletState {
  List<AccountState> accounts = [AccountState()];
}

class AccountState {
  int confirmedBalance = 0;
  int unconfirmedBalance = 0;
  Map<String /* outpoint */, Coin> coins = {};
  Map<String /* txid */, Transaction> transactions = {};
  late String descriptor;
  late Network network;
  late String name;
  late AccountType accountType;
}

class Coin {
  /* Use rust class instead */
}

class Transaction {
  /* Use rust class instead */
}

class Network {
  /* Use rust class instead */
}

enum AccountType { none }
