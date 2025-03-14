import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/locale/locale_provider.dart';
import 'package:tanami_capital_task/app_core/widgets/image_widget.dart';
import 'package:tanami_capital_task/features/dashboard_feature/presentation/provider/dashboard_provider.dart';
import 'package:tanami_capital_task/features/profile_feature/presentation/provider/profile_provider.dart';

import '../../../app_core/style/colors/colors.dart';
import '../../home_feature/presentation/components/HomeCustomScaffold.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeCustomScaffold(
      screenStatus: context.watch<DashboardProvider>().state.status,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 44.w),
        child: Column(
          spacing: 12.h,
          children: [
            ImageWidget(
                context
                    .read<DashboardProvider>()
                    .state
                    .responseDashboardModel
                    ?.user
                    ?.profilePicture,
                radius: 100,
                height: 120),
            Text(
              "Mohamed Abdelhady",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.h),
            InkWell(
              onTap: () {
                context.read<LocaleProvider>().changeLanguage();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1, color: AppColors.primary)),
                alignment: Alignment.center,
                child: Text(
                  context.read<LocaleProvider>().locale.languageCode == "ar"
                      ? "English"
                      : "عربي",
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              width: 90.w,
              child: Divider(
                height: 8,
                color: AppColors.primary,
              ),
            ),
            InkWell(
              onTap: () {
                context.read<ProfileProvider>().logout();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.red,
                ),
                alignment: Alignment.center,
                child: Text(
                  context.tr.logout.toUpperCase(),
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
