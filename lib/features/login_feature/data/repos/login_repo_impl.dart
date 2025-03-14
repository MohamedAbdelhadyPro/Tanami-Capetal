import 'package:multiple_result/src/result.dart';
import 'package:tanami_capital_task/app_core/storage/storage_repo.dart';
import 'package:tanami_capital_task/features/login_feature/data/fake_data/login_fake_data.dart';

import '../../../../app_core/unit/failures.dart';
import '../../domain/request_models/login_request_model.dart';
import '../respone_models/user_model.dart';
import 'login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  StorageRepo storageRepo;
  LoginRepoImpl({required this.storageRepo});

  @override
  Future<Result<UserModel?, Failure>> login(
      LoginRequestModel requestModel) async {
    if (requestModel.phone == userFakeData.phone &&
        requestModel.password == userFakeData.userPassword) {
      storageRepo.write(key: "IsUserLoggedIn", value: "true");
      return Success(userFakeData);
    }
    return Error(Failure(
        message: "Incorrect password. Please try again.", statusCode: 401));
  }
}
