import 'package:multiple_result/multiple_result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type, dynamic>> call(Params params);
}

class NoParams {}
