class StockDetails {
  String? symbol;
  String? company;
  String? logo;
  String? backgroundColor;
  double? currentPrice;
  double? priceChange;
  double? changePercentage;
  String? chartImage;
  List<HistoricalDatum>? historicalData;

  StockDetails({
    this.symbol,
    this.company,
    this.logo,
    this.backgroundColor,
    this.currentPrice,
    this.priceChange,
    this.changePercentage,
    this.chartImage,
    this.historicalData,
  });

  factory StockDetails.fromJson(Map<String, dynamic> json) => StockDetails(
        symbol: json["symbol"],
        company: json["company"],
        logo: json["logo"],
        backgroundColor: json["background_color"],
        currentPrice: json["current_price"]?.toDouble(),
        priceChange: json["price_change"]?.toDouble(),
        changePercentage: json["change_percentage"]?.toDouble(),
        chartImage: json["chart_image"],
        historicalData: json["historical_data"] == null
            ? []
            : List<HistoricalDatum>.from(json["historical_data"]!
                .map((x) => HistoricalDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "company": company,
        "logo": logo,
        "background_color": backgroundColor,
        "current_price": currentPrice,
        "price_change": priceChange,
        "change_percentage": changePercentage,
        "chart_image": chartImage,
        "historical_data": historicalData == null
            ? []
            : List<dynamic>.from(historicalData!.map((x) => x.toJson())),
      };
}

class HistoricalDatum {
  DateTime? date;
  double? price;

  HistoricalDatum({
    this.date,
    this.price,
  });

  factory HistoricalDatum.fromJson(Map<String, dynamic> json) =>
      HistoricalDatum(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "price": price,
      };
}
