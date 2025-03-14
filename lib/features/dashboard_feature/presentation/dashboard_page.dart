import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/unit/OnceFutureBuilder.dart';
import 'package:tanami_capital_task/features/dashboard_feature/presentation/components/dashboard_appbar_with_balance_component.dart';
import 'package:tanami_capital_task/features/dashboard_feature/presentation/provider/dashboard_provider.dart';

import '../../home_feature/presentation/components/HomeCustomScaffold.dart';
import 'components/my_watch_list_component.dart';
import 'components/stock_portfolio_component.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OnceFutureBuilder(future: () async {
      context.read<DashboardProvider>().getDashboardData();
    }, builder: (context, snapshot) {
      return HomeCustomScaffold(
          screenStatus: context.watch<DashboardProvider>().state.status,
          onSwipeRefresh: () {
            context.read<DashboardProvider>().refreshData();
          },
          body: Column(
            spacing: 14.h,
            children: [
              // Header
              DashboardAppbarWithBalanceComponent(),
              // Stock Portfolio
              StockPortfolioComponent(),
              // My WatchList
              MyWatchListComponent(),
              SizedBox(
                height: 5.h,
              )
            ],
          ));
    });
  }
}
