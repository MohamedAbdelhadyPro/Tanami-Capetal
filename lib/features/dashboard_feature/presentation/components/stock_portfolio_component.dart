import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';
import 'package:tanami_capital_task/features/dashboard_feature/presentation/provider/dashboard_provider.dart';

import '../../../../app_core/widgets/custom_container_widget.dart';
import '../items/stock_portfolio_item.dart';

class StockPortfolioComponent extends StatelessWidget {
  const StockPortfolioComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      final data = provider.state.responseDashboardModel?.portfolio;
      return CustomContainerWidget(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
              child: Row(
                spacing: 4.h,
                children: [
                  Text(
                    context.tr.stock_portfolio,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(context.tr.view_all,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue))
                ],
              ),
            ),
            SizedBox(
              height: 138.h,
              child: ListView.separated(
                itemCount: data?.length ?? 0,
                padding: EdgeInsets.all(12),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (ctx, index) {
                  return SizedBox(width: 8.w);
                },
                itemBuilder: (ctx, index) {
                  return StockPortfolioItem(portfolio: data![index]);
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
