import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'market_actions_model.dart';
import 'portfolio_model.dart';
import 'stock_details_model.dart';
import 'user_model.dart';

ResponseDashboardModel responseDashboardModelFromJson(String str) =>
    ResponseDashboardModel.fromJson(json.decode(str));

class ResponseDashboardModel extends Equatable {
  User? user;
  List<Portfolio>? portfolio;
  List<Portfolio>? watchlist;
  StockDetails? stockDetails;
  MarketActions? marketActions;

  ResponseDashboardModel({
    this.user,
    this.portfolio,
    this.watchlist,
    this.stockDetails,
    this.marketActions,
  });

  factory ResponseDashboardModel.fromJson(Map<String, dynamic> json) =>
      ResponseDashboardModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        portfolio: json["portfolio"] == null
            ? []
            : List<Portfolio>.from(
                json["portfolio"]!.map((x) => Portfolio.fromJson(x))),
        watchlist: json["watchlist"] == null
            ? []
            : List<Portfolio>.from(
                json["watchlist"]!.map((x) => Portfolio.fromJson(x))),
        stockDetails: json["stock_details"] == null
            ? null
            : StockDetails.fromJson(json["stock_details"]),
        marketActions: json["market_actions"] == null
            ? null
            : MarketActions.fromJson(json["market_actions"]),
      );

  @override
  List<Object?> get props =>
      [user, portfolio, watchlist, stockDetails, marketActions];
}
