import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/unit/OnceFutureBuilder.dart';
import 'package:tanami_capital_task/features/dashboard_feature/presentation/provider/dashboard_provider.dart';
import 'package:tanami_capital_task/features/market_feature/presentation/components/market_watch_list_component.dart';
import 'package:tanami_capital_task/features/market_feature/presentation/provider/market_provider.dart';

import '../../../app_core/style/colors/colors.dart';
import '../../../app_core/widgets/custom_container_widget.dart';
import '../../home_feature/presentation/components/HomeCustomScaffold.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnceFutureBuilder(future: () async {
      context.read<MarketProvider>().getMarketData();
    }, builder: (context, snapshot) {
      return HomeCustomScaffold(
          screenStatus: context.watch<MarketProvider>().state.status,
          numOfRepeatBodyInLoading: 1,
          onSwipeRefresh: () {
            context.read<MarketProvider>().refreshData();
          },
          body: Column(
            spacing: 14.h,
            children: [
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
                                  fontSize: 14.sp,
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "\$${context.read<DashboardProvider>().state.responseDashboardModel?.user?.balance ?? '0'}",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          CustomContainerWidget(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
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
              ),
              MarketWatchListComponent(),
            ],
          ));
    });
  }
}
