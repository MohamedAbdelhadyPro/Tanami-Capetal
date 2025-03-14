import '../../../../app_core/setup_provider/base/base_provider_state.dart';
import '../../../../app_core/unit/failures.dart';

class ProfileState extends BaseProviderState {
  const ProfileState({super.status, super.failure});

  ProfileState copyWith({
    ScreenStatus? status,
    Failure? failure,
  }) {
    return ProfileState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
