class WalletState {
  List<AccountState> accounts = [AccountState()];
}

class AccountState {
  int confirmedBalance = 0;
  int unconfirmedBalance = 0;
  Map<String /* outpoint */, Coin> coins = {};
  Map<String /* txid */, Transaction> transactions = {};
  String? descriptor;
}

class Coin {
  /* Use rust class instead */
}

class Transaction {
  /* Use rust class instead */
}
