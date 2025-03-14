import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/routes/app_routes.dart';
import 'package:tanami_capital_task/app_core/storage/storage_repo.dart';
import 'package:tanami_capital_task/app_core/unit/usecase.dart';
import 'package:tanami_capital_task/features/initializer_feature/domain/usecases/get_countries_use_case.dart';
import 'package:tanami_capital_task/features/login_feature/presentation/provider/login_provider.dart';

import '../../../../app_core/di/di.dart';
import '../../../../app_core/routes/nav_service.dart';
import 'initializer_state.dart';

class InitializerProvider extends ChangeNotifier {
  InitializerState state =
      InitializerState(countryList: [], showAgainBtn: false);
  GetCountriesUseCase getCountriesUseCase;

  InitializerProvider({required this.getCountriesUseCase});

  init() async {
    state = state.copyWith(showAgainBtn: false);
    await Future.wait([
      Future.delayed(Duration(seconds: 2)),
      getCountryList(),
    ]);
    if (await di<StorageRepo>().isContains("IsUserLoggedIn")) {
      bool? isAuthOK = await di<NavService>()
          .navKey
          .currentContext
          ?.read<LoginProvider>()
          .authenticateFaceId();
      if (!(isAuthOK!)) {
        state = state.copyWith(showAgainBtn: true);
        notifyListeners();
      }
    } else {
      GoTo.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
    }
  }

  Future<void> getCountryList() async {
    final result = await getCountriesUseCase.call(NoParams());
    result.when((success) {
      state = state.copyWith(countryList: success);
      notifyListeners();
    }, (error) {
      state = state.copyWith(countryList: []);
      notifyListeners();
    });
  }
}
