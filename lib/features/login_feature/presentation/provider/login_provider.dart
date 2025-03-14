import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:tanami_capital_task/app_core/routes/app_routes.dart';
import 'package:tanami_capital_task/app_core/routes/nav_service.dart';
import 'package:tanami_capital_task/app_core/storage/storage_repo.dart';
import 'package:tanami_capital_task/app_core/unit/toast_m.dart';
import 'package:tanami_capital_task/features/login_feature/domain/request_models/login_request_model.dart';
import 'package:tanami_capital_task/features/login_feature/domain/usecases/login_use_case.dart';

import '../../../../app_core/di/di.dart';
import '../../../../app_core/setup_provider/base/base_provider_state.dart';
import 'login_state.dart';

class LoginProvider extends ChangeNotifier {
  LoginState state = LoginState();
  LoginUseCase loginUseCase;

  LoginProvider({required this.loginUseCase});

  login({required String phone, required String password}) async {
    state = state.copyWith(status: ScreenStatus.loading);
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    final result = await loginUseCase.call(
        LoginRequestModel(phone: phone.trim(), password: password.trim()));
    result.when((success) {
      state = state.copyWith(status: ScreenStatus.loaded);
      notifyListeners();
      GoTo.pushNamed(AppRoutes.homeScreen);
    }, (error) {
      ToastM.show(error.message ?? '');
      state = state.copyWith(failure: error, status: ScreenStatus.error);
      notifyListeners();
    });
  }

  Future<bool> authenticateFaceId() async {
    final LocalAuthentication auth = LocalAuthentication();
    try {
      bool isAuthenticated = await auth.authenticate(
        localizedReason: 'يرجى التحقق من هويتك عبر البصمة أو التعرف على الوجه',
        options: AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
      if (isAuthenticated) {
        di<StorageRepo>().write(key: "IsUserLoggedIn", value: "true");
        GoTo.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
      }
      return isAuthenticated;
    } catch (e) {
      return false;
    }
  }
}
