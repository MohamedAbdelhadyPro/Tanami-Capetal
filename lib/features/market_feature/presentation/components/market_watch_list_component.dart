import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/routes/app_routes.dart';
import 'package:tanami_capital_task/app_core/routes/nav_service.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';

import '../../../../app_core/widgets/custom_container_widget.dart';
import '../items/market_watchlist_item.dart';
import '../provider/market_provider.dart';

class MarketWatchListComponent extends StatelessWidget {
  const MarketWatchListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(builder: (context, provider, child) {
      final data = provider.state.responseMarketModel;
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
                    context.tr.my_watch_list,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.keyboard_arrow_up_rounded, size: 14),
                      Icon(Icons.keyboard_arrow_down_rounded, size: 14),
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      GoTo.pushNamed(AppRoutes.viewPdfPage);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(context.tr.view_pdf,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blue)),
                    ),
                  )
                ],
              ),
            ),
            ListView.separated(
              itemCount: data?.watchlist?.length ?? 0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(12),
              separatorBuilder: (ctx, index) {
                return SizedBox(width: 8.w);
              },
              itemBuilder: (ctx, index) {
                return MarketWatchlistItem(portfolio: data!.watchlist![index]);
              },
            )
          ],
        ),
      );
    });
  }
}
