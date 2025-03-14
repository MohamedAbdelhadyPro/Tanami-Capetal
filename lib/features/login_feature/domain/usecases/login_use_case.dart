import 'package:multiple_result/multiple_result.dart';
import 'package:tanami_capital_task/features/login_feature/data/repos/login_repo.dart';

import '../../../../app_core/unit/failures.dart';
import '../../../../app_core/unit/usecase.dart';
import '../../data/respone_models/user_model.dart';
import '../request_models/login_request_model.dart';

class LoginUseCase extends UseCase<UserModel?, LoginRequestModel> {
  LoginUseCase({required this.loginRepo});
  final LoginRepo loginRepo;

  @override
  Future<Result<UserModel?, Failure>> call(
      LoginRequestModel requestModel) async {
    return await loginRepo.login(requestModel);
  }
}
