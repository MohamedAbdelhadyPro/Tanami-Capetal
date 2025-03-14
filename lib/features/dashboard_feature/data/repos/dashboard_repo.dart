import 'package:multiple_result/multiple_result.dart';

import '../../../../app_core/unit/failures.dart';
import '../respone_models/response_dashboard_model.dart';

abstract class DashboardRepo {
  Future<Result<ResponseDashboardModel, Failure>> getDashboardData();
}
