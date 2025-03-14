import 'investment_model.dart';

class MarketActions {
  double? availableBalance;
  Investment? investment;
  List<dynamic>? quickTradeOptions;

  MarketActions({
    this.availableBalance,
    this.investment,
    this.quickTradeOptions,
  });

  factory MarketActions.fromJson(Map<String, dynamic> json) => MarketActions(
        availableBalance: json["available_balance"]?.toDouble(),
        investment: json["investment"] == null
            ? null
            : Investment.fromJson(json["investment"]),
        quickTradeOptions: json["quick_trade_options"] == null
            ? []
            : List<dynamic>.from(json["quick_trade_options"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "available_balance": availableBalance,
        "investment": investment?.toJson(),
        "quick_trade_options": quickTradeOptions == null
            ? []
            : List<dynamic>.from(quickTradeOptions!.map((x) => x)),
      };
}
