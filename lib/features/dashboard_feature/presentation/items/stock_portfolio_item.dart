import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanami_capital_task/app_core/extensions/hex_to_color_extension.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';
import 'package:tanami_capital_task/app_core/widgets/custom_container_widget.dart';
import 'package:tanami_capital_task/features/dashboard_feature/data/respone_models/portfolio_model.dart';

import '../../../../app_core/style/images/assets.gen.dart';
import '../../../../app_core/widgets/image_widget.dart';

class StockPortfolioItem extends StatelessWidget {
  const StockPortfolioItem({super.key, required this.portfolio});
  final Portfolio portfolio;

  @override
  Widget build(BuildContext context) {
    return CustomContainerWidget(
      width: 150.w,
      radius: 12.h,
      color: Colors.grey.shade50,
      child: Column(
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
          CustomContainerWidget(
            width: double.infinity,
            radius: 8,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            padding: EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${portfolio.price}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 4.w,
                  children: [
                    ImageWidget(Assets.images.arrowChart.path,
                        color: AppColors.green,
                        width: 20,
                        height: 22,
                        fit: BoxFit.contain),
                    Text(
                      "+\$${portfolio.change} (+${portfolio.changePercentage}%)",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
