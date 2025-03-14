import '../../../../app_core/setup_provider/base/base_provider_state.dart';
import '../../../../app_core/unit/failures.dart';

class LoginState extends BaseProviderState {
  const LoginState({
    super.status,
    super.failure,
  });

  LoginState copyWith({
    ScreenStatus? status,
    Failure? failure,
  }) {
    return LoginState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
