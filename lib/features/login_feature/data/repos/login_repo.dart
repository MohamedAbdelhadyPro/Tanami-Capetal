import 'package:multiple_result/multiple_result.dart';

import '../../../../app_core/unit/failures.dart';
import '../../domain/request_models/login_request_model.dart';
import '../respone_models/user_model.dart';

abstract class LoginRepo {
  Future<Result<UserModel?, Failure>> login(LoginRequestModel requestModel);
}
