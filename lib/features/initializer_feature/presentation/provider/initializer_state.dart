import 'package:tanami_capital_task/features/initializer_feature/data/respone_models/country_model.dart';

import '../../../../app_core/setup_provider/base/base_provider_state.dart';
import '../../../../app_core/unit/failures.dart';

class InitializerState extends BaseProviderState {
  final List<CountryModel>? countryList;
  final bool? showAgainBtn;

  const InitializerState({
    super.status,
    super.failure,
    this.countryList,
    this.showAgainBtn,
  });

  InitializerState copyWith(
      {ScreenStatus? status,
      Failure? failure,
      List<CountryModel>? countryList,
      bool? showAgainBtn}) {
    return InitializerState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      countryList: countryList ?? this.countryList,
      showAgainBtn: showAgainBtn ?? this.showAgainBtn,
    );
  }
}
