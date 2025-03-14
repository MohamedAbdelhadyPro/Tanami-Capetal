import 'package:multiple_result/multiple_result.dart';

import '../../../../app_core/unit/failures.dart';
import '../respone_models/response_market_model.dart';

abstract class MarketRepo {
  Future<Result<ResponseMarketModel, Failure>> getMarketData();
}
