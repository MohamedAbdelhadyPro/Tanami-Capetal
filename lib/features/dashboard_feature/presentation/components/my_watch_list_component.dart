import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';

import '../../../../app_core/widgets/custom_container_widget.dart';
import '../items/my_watchlist_item.dart';
import '../provider/dashboard_provider.dart';

class MyWatchListComponent extends StatelessWidget {
  const MyWatchListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      final data = provider.state.responseDashboardModel;
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
                  Text(context.tr.add_new,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue))
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
                return MyWatchlistItem(portfolio: data!.watchlist![index]);
              },
            )
          ],
        ),
      );
    });
  }
}
