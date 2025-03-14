import 'package:equatable/equatable.dart';

import '../../unit/failures.dart';

enum ScreenStatus { init, loading, loaded, empty, error }

enum ButtonStatus { active, unActive }

abstract class BaseProviderState extends Equatable {
  final ScreenStatus status;
  final Failure? failure;

  const BaseProviderState({
    this.status = ScreenStatus.init,
    this.failure,
  });

  @override
  List<Object?> get props => [status, failure];
}
