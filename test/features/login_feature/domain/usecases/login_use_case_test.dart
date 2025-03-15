import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:tanami_capital_task/app_core/unit/failures.dart';
import 'package:tanami_capital_task/features/login_feature/data/repos/login_repo.dart';
import 'package:tanami_capital_task/features/login_feature/data/respone_models/user_model.dart';
import 'package:tanami_capital_task/features/login_feature/domain/request_models/login_request_model.dart';
import 'package:tanami_capital_task/features/login_feature/domain/usecases/login_use_case.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  late LoginUseCase loginUseCase;
  late MockLoginRepo mockLoginRepo;

  setUpAll(() {
    provideDummy<Result<UserModel?, Failure>>(Result.error(Failure()));
  });

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    loginUseCase = LoginUseCase(loginRepo: mockLoginRepo);
  });

  test('should return UserModel when login is successful', () async {
    final request =
        LoginRequestModel(phone: "test_phone", password: "test_password");
    final expectedUser = UserModel(
        id: 1,
        username: "Test User",
        phone: "test_phone",
        userPassword: "test_password");

    when(mockLoginRepo.login(request))
        .thenAnswer((_) async => Success(expectedUser));

    final result = await loginUseCase.call(request);

    expect(result.isSuccess(), true);
    expect(result.tryGetSuccess(), expectedUser);
  });

  test('should return Failure when login fails', () async {
    final request = LoginRequestModel(phone: "wrong", password: "wrong");

    when(mockLoginRepo.login(request)).thenAnswer(
        (_) async => Error(Failure(message: "Invalid credentials")));

    final result = await loginUseCase.call(request);

    expect(result.isError(), true);
    expect(result.tryGetError()!.message, "Invalid credentials");
  });
}
