import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/routes/app_routes.dart';
import 'package:tanami_capital_task/app_core/routes/nav_service.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';

import '../../style/images/assets.gen.dart';

class ServerErrorScreen extends StatelessWidget {
  const ServerErrorScreen({
    Key? key,
    this.height = 300,
    this.msg,
  }) : super(key: key);
  final double height;
  final String? msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Lottie.asset(Assets.lottie.serverError.path,
                  height: height, fit: BoxFit.cover)),
          SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              msg ?? context.tr.server_error,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 5.h),
          Center(
            child: InkWell(
              onTap: () {
                GoTo.pushNamedAndRemoveUntil(AppRoutes.initializer);
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    context.tr.try_again,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
