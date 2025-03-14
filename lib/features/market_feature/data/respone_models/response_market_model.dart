import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'portfolio_model.dart';

ResponseMarketModel responseMarketModelFromJson(String str) =>
    ResponseMarketModel.fromJson(json.decode(str));

class ResponseMarketModel extends Equatable {
  final List<Portfolio>? portfolio;
  final List<Portfolio>? watchlist;

  const ResponseMarketModel({
    this.portfolio,
    this.watchlist,
  });

  factory ResponseMarketModel.fromJson(Map<String, dynamic> json) =>
      ResponseMarketModel(
        portfolio: json["portfolio"] == null
            ? []
            : List<Portfolio>.from(
                json["portfolio"]!.map((x) => Portfolio.fromJson(x))),
        watchlist: json["watchlist"] == null
            ? []
            : List<Portfolio>.from(
                json["watchlist"]!.map((x) => Portfolio.fromJson(x))),
      );

  @override
  List<Object?> get props => [portfolio, watchlist];
}
