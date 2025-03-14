import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/locale/locale_provider.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';
import 'package:tanami_capital_task/app_core/unit/OnceFutureBuilder.dart';
import 'package:tanami_capital_task/app_core/widgets/image_widget.dart';

import '../../../app_core/style/images/assets.gen.dart';
import 'provider/initializer_provider.dart';

class InitializerScreen extends StatelessWidget {
  const InitializerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnceFutureBuilder(future: () async {
        context.read<InitializerProvider>().init();
        context.read<LocaleProvider>().init();
      }, builder: (context, snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30.h,
          children: [
            Center(
              child: ImageWidget(
                Assets.images.logo.path,
                radius: 32,
                width: 140.w,
              ),
            ),
            Text(
              "Tanami Capetal".toUpperCase(),
              style: TextStyle(fontSize: 22.sp),
            ),
            Consumer<InitializerProvider>(builder: (context, provider, child) {
              if (provider.state.showAgainBtn == false) {
                return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 20),
                    child: Text(""));
              }
              return InkWell(
                  onTap: () {
                    provider.init();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.border),
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Text(context.tr.try_again.toUpperCase()),
                  ));
            })
          ],
        );
      }),
    );
  }
}
