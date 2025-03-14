import '../../../../app_core/setup_provider/base/base_provider_state.dart';
import '../../../../app_core/unit/failures.dart';
import '../../data/respone_models/response_market_model.dart';

class MarketState extends BaseProviderState {
  final ResponseMarketModel? responseMarketModel;
  const MarketState({super.status, super.failure, this.responseMarketModel});

  MarketState copyWith({
    ScreenStatus? status,
    Failure? failure,
    ResponseMarketModel? responseMarketModel,
  }) {
    return MarketState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
      responseMarketModel: responseMarketModel ?? this.responseMarketModel,
    );
  }
}
