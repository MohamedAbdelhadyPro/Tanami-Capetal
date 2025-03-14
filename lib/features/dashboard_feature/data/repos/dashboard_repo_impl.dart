import 'package:multiple_result/src/result.dart';
import 'package:tanami_capital_task/app_core/network/api_endpoints.dart';
import 'package:tanami_capital_task/app_core/network/network_helper.dart';

import '../../../../app_core/unit/failures.dart';
import '../respone_models/response_dashboard_model.dart';
import 'dashboard_repo.dart';

class DashboardRepoImpl implements DashboardRepo {
  NetworkHelper networkHelper;

  DashboardRepoImpl({required this.networkHelper});

  @override
  Future<Result<ResponseDashboardModel, Failure>> getDashboardData() async {
    final response = await networkHelper.get(
      APIEndpoints.getDashboardData,
      isNeedAuth: false,
    );

    return response.when(
      (success) {
        if (success != null) {
          return Success(responseDashboardModelFromJson(success));
        }
        return Error(Failure());
      },
      (error) => Error(error),
    );
  }
}
