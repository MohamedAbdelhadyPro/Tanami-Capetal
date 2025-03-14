import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/setup_provider/base/base_provider_state.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';
import 'package:tanami_capital_task/app_core/unit/toast_m.dart';
import 'package:tanami_capital_task/app_core/widgets/failds_widgets/phone_number_widget.dart';
import 'package:tanami_capital_task/app_core/widgets/image_widget.dart';
import 'package:tanami_capital_task/features/login_feature/presentation/provider/login_provider.dart';

import '../../../app_core/style/images/assets.gen.dart';
import '../../../app_core/widgets/failds_widgets/password_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController password = TextEditingController();
  String finalPhone = "";
  bool isPhoneOK = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          spacing: 10.h,
          children: [
            SizedBox(height: 90.h),
            ImageWidget(Assets.images.logo2.path, width: 200.w, radius: 22),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: Text(
                context.tr.login_hint,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: PhoneNumberWidget(
                finalPhoneNumber: (String fPhone) {
                  finalPhone = fPhone;
                },
                isPhoneOK: (bool phoneStatus) {
                  isPhoneOK = phoneStatus;
                },
              ),
            ),
            SizedBox(height: 0),
            Center(
              child: PasswordWidget(
                passwordNoController: password,
                isPasswordValid: (bool isPassOK) {},
                label: context.tr.password,
              ),
            ),
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: InkWell(
                  onTap: () {
                    ToastM.show(context.tr.forgot_password);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      context.tr.forgot_password,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.sp),
                    ),
                  ),
                )),
            SizedBox(height: 5.h),
            Row(
              spacing: 6.w,
              children: [
                Expanded(
                  child: Consumer<LoginProvider>(
                      builder: (context, provider, child) {
                    return Center(
                      child: InkWell(
                        onTap: () {
                          if (finalPhone.trim().isEmpty) {
                            ToastM.show("Phone Empty");
                            return;
                          }
                          if (password.text.trim().isEmpty) {
                            ToastM.show("Password Empty");
                            return;
                          }
                          if (!isPhoneOK) {
                            ToastM.show("Phone Incorrect");
                            return;
                          }
                          context.read<LoginProvider>().login(
                                phone: finalPhone,
                                password: password.text,
                              );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: provider.state.status == ScreenStatus.loading
                              ? 50
                              : ScreenUtil().screenWidth,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.primary,
                          ),
                          alignment: Alignment.center,
                          child: provider.state.status == ScreenStatus.loading
                              ? CircularProgressIndicator(
                                  color: AppColors.white,
                                )
                              : Text(
                                  context.tr.login.toUpperCase(),
                                  style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                        ),
                      ),
                    );
                  }),
                ),
                InkWell(
                    onTap: () {
                      context.read<LoginProvider>().authenticateFaceId();
                    },
                    child: ImageWidget(Assets.images.faceId.path,
                        width: 55.w, height: 55.w))
              ],
            ),
            Spacer(),
            Text(
              context.tr.do_not_have_account,
              style: TextStyle(fontSize: 16.sp),
            ),
            InkWell(
              onTap: () {
                ToastM.show(context.tr.register);
              },
              child: Container(
                width: ScreenUtil().screenWidth,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: Text(
                  context.tr.register.toUpperCase(),
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
