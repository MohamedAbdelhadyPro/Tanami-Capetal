import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:tanami_capital_task/app_core/storage/storage_repo.dart';
import 'package:tanami_capital_task/features/login_feature/data/fake_data/login_fake_data.dart';
import 'package:tanami_capital_task/features/login_feature/data/repos/login_repo_impl.dart';
import 'package:tanami_capital_task/features/login_feature/domain/request_models/login_request_model.dart';

import 'login_repo_impl_test.mocks.dart';

@GenerateMocks([StorageRepo])
void main() {
  late LoginRepoImpl loginRepo;
  late MockStorageRepo mockStorageRepo;

  setUp(() {
    mockStorageRepo = MockStorageRepo();
    loginRepo = LoginRepoImpl(storageRepo: mockStorageRepo);
  });

  test('should return a UserModel when login is successful', () async {
    final request = LoginRequestModel(
        phone: userFakeData.phone, password: userFakeData.userPassword);

    final result = await loginRepo.login(request);

    expect(result.isSuccess(), true);
    expect(result.tryGetSuccess(), userFakeData);
  });

  test('should return Failure when credentials are incorrect', () async {
    final request =
        LoginRequestModel(phone: "wrong_phone", password: "wrong_password");

    final result = await loginRepo.login(request);

    expect(result.isError(), true);
    expect(
        result.tryGetError()!.message, "Incorrect password. Please try again.");
  });
}
