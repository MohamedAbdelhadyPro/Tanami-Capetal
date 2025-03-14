import 'package:flutter/cupertino.dart';
import 'package:tanami_capital_task/features/market_feature/data/respone_models/response_market_model.dart';

import '../../../../app_core/setup_provider/base/base_provider_state.dart';
import '../../../../app_core/unit/usecase.dart';
import '../../domain/usecases/get_market_data_use_case.dart';
import 'market_state.dart';

class MarketProvider extends ChangeNotifier {
  MarketState state = MarketState();
  GetMarketDataUseCase getMarketDataUseCase;

  MarketProvider({required this.getMarketDataUseCase});

  Future<void> getMarketData() async {
    state = state.copyWith(
        status: ScreenStatus.loading,
        responseMarketModel: ResponseMarketModel());
    final result = await getMarketDataUseCase.call(NoParams());
    result.when((ResponseMarketModel success) {
      state = state.copyWith(
          responseMarketModel: success, status: ScreenStatus.loaded);
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
    getMarketData();
  }
}
