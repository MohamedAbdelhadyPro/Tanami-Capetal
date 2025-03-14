class Investment {
  String? symbol;
  String? company;
  String? logo;
  double? price;
  double? estimatedCost;
  double? availableTrade;

  Investment({
    this.symbol,
    this.company,
    this.logo,
    this.price,
    this.estimatedCost,
    this.availableTrade,
  });

  factory Investment.fromJson(Map<String, dynamic> json) => Investment(
        symbol: json["symbol"],
        company: json["company"],
        logo: json["logo"],
        price: json["price"]?.toDouble(),
        estimatedCost: json["estimated_cost"]?.toDouble(),
        availableTrade: json["available_trade"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "company": company,
        "logo": logo,
        "price": price,
        "estimated_cost": estimatedCost,
        "available_trade": availableTrade,
      };
}
