import '../../../../app_core/setup_provider/base/base_provider_state.dart';
import '../../../../app_core/unit/failures.dart';
import '../../data/respone_models/response_dashboard_model.dart';

class DashboardState extends BaseProviderState {
  final ResponseDashboardModel? responseDashboardModel;
  const DashboardState(
      {super.status, super.failure, this.responseDashboardModel});

  DashboardState copyWith({
    ScreenStatus? status,
    Failure? failure,
    ResponseDashboardModel? responseDashboardModel,
  }) {
    return DashboardState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      responseDashboardModel:
          responseDashboardModel ?? this.responseDashboardModel,
    );
  }
}
