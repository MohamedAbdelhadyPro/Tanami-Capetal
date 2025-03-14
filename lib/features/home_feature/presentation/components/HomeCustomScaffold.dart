import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanami_capital_task/app_core/setup_provider/base/base_provider_state.dart';
import 'package:tanami_capital_task/app_core/widgets/shimmer_widget.dart';

import '../../../../app_core/style/colors/colors.dart';
import '../../../../app_core/style/images/assets.gen.dart';
import '../../../../app_core/widgets/custom_container_widget.dart';
import '../../../../app_core/widgets/image_widget.dart';

class HomeCustomScaffold extends StatelessWidget {
  HomeCustomScaffold({
    super.key,
    required this.body,
    this.screenStatus = ScreenStatus.init,
    this.numOfRepeatBodyInLoading = 1,
    this.onSwipeRefresh,
  });

  final Widget body;
  ScreenStatus? screenStatus;
  int? numOfRepeatBodyInLoading;
  Function? onSwipeRefresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                AppColors.secondary2.withOpacity(.3),
                Colors.grey.shade50,
                Colors.grey.shade50,
                Colors.grey.shade50,
              ])),
        ),
        RefreshIndicator(
          onRefresh: () async {
            if (onSwipeRefresh != null) {
              onSwipeRefresh!();
            }
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        ImageWidget(
                          Assets.images.logo3.path,
                          height: 32,
                        ),
                        Spacer(),
                        CustomContainerWidget(
                          padding: EdgeInsets.all(10),
                          radius: 50,
                          child: Icon(
                            Icons.notifications_active_outlined,
                            size: 24,
                            color: AppColors.greyDark,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                handleBody(
                  body: body,
                  screenStatus: screenStatus!,
                  numOfRepeatBodyInLoading: numOfRepeatBodyInLoading!,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget handleBody(
      {required Widget body,
      required ScreenStatus screenStatus,
      required int numOfRepeatBodyInLoading}) {
    switch (screenStatus) {
      case ScreenStatus.init:
      case ScreenStatus.loaded:
        return body;
      case ScreenStatus.loading:
        if (numOfRepeatBodyInLoading > 1) {
          return ShimmerWidget(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (ctx, index) => SizedBox(
                      height: 4.h,
                    ),
                separatorBuilder: (ctx, index) => body,
                itemCount: numOfRepeatBodyInLoading),
          );
        }
        return ShimmerWidget(child: body);
      case ScreenStatus.error:
        return Center(child: Text("Error"));
      default:
        return body;
    }
  }
}
