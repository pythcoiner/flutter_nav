const int kSats = 100_000_000;

enum Currency {
  hidden,
  btc,
  sat,
  eur,
  usd;

  @override
  String toString() {
    return switch (this) {
      Currency.hidden => "***",
      Currency.btc => "BTC",
      Currency.sat => "sats",
      Currency.eur => "€",
      Currency.usd => "\$",
    };
  }

  String format(double amount) {
    return "$amount ${toString()}";
  }
}

class CurrencyState {
  Currency displayCurrency = Currency.btc;
  Map<Currency, int? /* rate */> rates = {Currency.btc: 1, Currency.sat: kSats};

  String amount(int sats) {
    Currency cur = displayCurrency;
    int? rate = rates[displayCurrency];
    if (rate == null) {
      cur = Currency.btc;
      rate = 1;
    }
    double value = sats * rate / kSats;
    if (cur == Currency.hidden) return cur.toString();
    return cur.format(value);
  }
}
