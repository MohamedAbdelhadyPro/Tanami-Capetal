import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';
import 'package:tanami_capital_task/features/dashboard_feature/presentation/provider/dashboard_provider.dart';

import '../../../../app_core/style/images/assets.gen.dart';
import '../../../../app_core/widgets/custom_container_widget.dart';
import '../../../../app_core/widgets/image_widget.dart';

class DashboardAppbarWithBalanceComponent extends StatelessWidget {
  const DashboardAppbarWithBalanceComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      final data = provider.state.responseDashboardModel;
      return Column(
        spacing: 4.h,
        children: [
          Text(
            context.tr.total_portfolio,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "\$${data?.user?.totalPortfolioValue ?? '0'}",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4.w,
            children: [
              ImageWidget(Assets.images.arrowChart.path,
                  color: AppColors.green,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain),
              Text(
                "+\$${data?.user?.portfolioGrowth ?? '0'} (+${data?.user?.growthPercentage ?? '0'}%)",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CustomContainerWidget(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    spacing: 8.w,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Text(
                            context.tr.your_balance,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\$${data?.user?.balance ?? '0'}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CustomContainerWidget(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        radius: 50,
                        color: AppColors.blue,
                        child: Row(
                          spacing: 4,
                          children: [
                            Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 20,
                            ),
                            Text(
                              context.tr.deposit,
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      CustomContainerWidget(
                        padding: EdgeInsets.all(8),
                        radius: 50,
                        child: Icon(Icons.more_vert),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
