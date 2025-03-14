import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanami_capital_task/app_core/extensions/hex_to_color_extension.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';

import '../../../../app_core/style/images/assets.gen.dart';
import '../../../../app_core/widgets/image_widget.dart';
import '../../data/respone_models/portfolio_model.dart';

class MarketWatchlistItem extends StatelessWidget {
  const MarketWatchlistItem({super.key, required this.portfolio});
  final Portfolio portfolio;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4.h,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 8,
            children: [
              CircleAvatar(
                backgroundColor: portfolio.backgroundColor?.hexToColor,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ImageWidget(portfolio.logo),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    portfolio.symbol ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    portfolio.company ?? '',
                    style: TextStyle(fontSize: 12, color: AppColors.greyDark),
                  ),
                ],
              )
            ],
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$${portfolio.price ?? 0}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 4.w,
              children: [
                ImageWidget(Assets.images.arrowChart.path,
                    color: AppColors.green,
                    width: 20,
                    height: 22,
                    fit: BoxFit.contain),
                Text(
                  "+${portfolio.changePercentage ?? 0}%",
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
