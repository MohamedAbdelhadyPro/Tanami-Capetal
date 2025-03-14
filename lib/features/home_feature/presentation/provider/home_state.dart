import '../../../../app_core/setup_provider/base/base_provider_state.dart';
import '../../../../app_core/unit/failures.dart';

class HomeState extends BaseProviderState {
  const HomeState({
    super.status,
    super.failure,
  });

  HomeState copyWith({
    ScreenStatus? status,
    Failure? failure,
  }) {
    return HomeState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
