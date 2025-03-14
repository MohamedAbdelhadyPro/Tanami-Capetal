import 'package:get_it/get_it.dart';

import 'repositories_di.dart';
import 'use_cases_di.dart';

GetIt di = GetIt.instance;

Future diInit() async {
  await initializeRepositories();
  await initializeUseCases();
}
