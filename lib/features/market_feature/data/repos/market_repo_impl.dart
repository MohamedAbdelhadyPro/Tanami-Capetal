import 'package:multiple_result/src/result.dart';
import 'package:tanami_capital_task/app_core/network/api_endpoints.dart';
import 'package:tanami_capital_task/app_core/network/network_helper.dart';

import '../../../../app_core/unit/failures.dart';
import '../respone_models/response_market_model.dart';
import 'market_repo.dart';

class MarketRepoImpl implements MarketRepo {
  NetworkHelper networkHelper;

  MarketRepoImpl({required this.networkHelper});

  @override
  Future<Result<ResponseMarketModel, Failure>> getMarketData() async {
    final response = await networkHelper.get(
      APIEndpoints.getMarketData,
      isNeedAuth: false,
    );

    return response.when(
      (success) {
        if (success != null) {
          return Success(responseMarketModelFromJson(success));
        }
        return Error(Failure());
      },
      (error) => Error(error),
    );
  }
}
