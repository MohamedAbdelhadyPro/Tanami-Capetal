import 'package:flutter_test/flutter_test.dart';

import 'features/login_feature/data/repos/login_repo_impl_test.dart'
    as login_repo_test;
import 'features/login_feature/domain/usecases/login_use_case_test.dart'
    as login_use_case_test;

void main() {
  group('login feature', () {
    login_repo_test.main();
    login_use_case_test.main();
  });
}
