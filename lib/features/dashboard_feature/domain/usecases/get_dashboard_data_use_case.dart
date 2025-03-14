import 'package:multiple_result/multiple_result.dart';
import 'package:tanami_capital_task/features/dashboard_feature/data/repos/dashboard_repo.dart';

import '../../../../app_core/unit/failures.dart';
import '../../../../app_core/unit/usecase.dart';
import '../../data/respone_models/response_dashboard_model.dart';

class GetDashboardDataUseCase
    extends UseCase<ResponseDashboardModel, NoParams> {
  GetDashboardDataUseCase({required this.dashboardRepo});
  final DashboardRepo dashboardRepo;

  @override
  Future<Result<ResponseDashboardModel, Failure>> call(NoParams params) async {
    return await dashboardRepo.getDashboardData();
  }
}
