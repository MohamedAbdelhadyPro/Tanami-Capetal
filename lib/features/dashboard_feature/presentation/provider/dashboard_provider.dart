import 'package:flutter/cupertino.dart';
import 'package:tanami_capital_task/features/dashboard_feature/data/respone_models/response_dashboard_model.dart';

import '../../../../app_core/setup_provider/base/base_provider_state.dart';
import '../../../../app_core/unit/usecase.dart';
import '../../domain/usecases/get_dashboard_data_use_case.dart';
import 'dashboard_state.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardState state = DashboardState();
  GetDashboardDataUseCase getDashboardDataUseCase;

  DashboardProvider({required this.getDashboardDataUseCase});

  Future<void> getDashboardData() async {
    state = state.copyWith(
        status: ScreenStatus.loading,
        responseDashboardModel: ResponseDashboardModel());
    final result = await getDashboardDataUseCase.call(NoParams());
    result.when((ResponseDashboardModel success) {
      state = state.copyWith(
          responseDashboardModel: success, status: ScreenStatus.loaded);

      notifyListeners();
    }, (error) {
      state = state.copyWith(failure: error, status: ScreenStatus.error);
      notifyListeners();
    });
  }

  refreshData() async {
    await Future.delayed(Duration(milliseconds: 300));
    state = state.copyWith(status: ScreenStatus.loading);
    notifyListeners();
    getDashboardData();
  }
}
