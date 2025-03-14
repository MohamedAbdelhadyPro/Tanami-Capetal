class User {
  String? name;
  String? profilePicture;
  double? balance;
  double? totalPortfolioValue;
  double? portfolioGrowth;
  double? growthPercentage;

  User({
    this.name,
    this.profilePicture,
    this.balance,
    this.totalPortfolioValue,
    this.portfolioGrowth,
    this.growthPercentage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        profilePicture: json["profile_picture"],
        balance: json["balance"]?.toDouble(),
        totalPortfolioValue: json["total_portfolio_value"]?.toDouble(),
        portfolioGrowth: json["portfolio_growth"]?.toDouble(),
        growthPercentage: json["growth_percentage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile_picture": profilePicture,
        "balance": balance,
        "total_portfolio_value": totalPortfolioValue,
        "portfolio_growth": portfolioGrowth,
        "growth_percentage": growthPercentage,
      };
}
