import 'package:multiple_result/multiple_result.dart';
import 'package:tanami_capital_task/features/market_feature/data/repos/market_repo.dart';

import '../../../../app_core/unit/failures.dart';
import '../../../../app_core/unit/usecase.dart';
import '../../data/respone_models/response_market_model.dart';

class GetMarketDataUseCase extends UseCase<ResponseMarketModel, NoParams> {
  GetMarketDataUseCase({required this.marketRepo});
  final MarketRepo marketRepo;

  @override
  Future<Result<ResponseMarketModel, Failure>> call(NoParams params) async {
    return await marketRepo.getMarketData();
  }
}
