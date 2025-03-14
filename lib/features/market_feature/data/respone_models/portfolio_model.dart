class Portfolio {
  String? symbol;
  String? company;
  String? logo;
  String? backgroundColor;
  double? price;
  double? change;
  double? changePercentage;

  Portfolio({
    this.symbol,
    this.company,
    this.logo,
    this.backgroundColor,
    this.price,
    this.change,
    this.changePercentage,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) => Portfolio(
        symbol: json["symbol"],
        company: json["company"],
        logo: json["logo"],
        backgroundColor: json["background_color"],
        price: json["price"]?.toDouble(),
        change: json["change"]?.toDouble(),
        changePercentage: json["change_percentage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "company": company,
        "logo": logo,
        "background_color": backgroundColor,
        "price": price,
        "change": change,
        "change_percentage": changePercentage,
      };
}
