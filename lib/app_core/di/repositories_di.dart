import 'package:tanami_capital_task/features/dashboard_feature/data/repos/dashboard_repo_impl.dart';
import 'package:tanami_capital_task/features/initializer_feature/data/repos/countries_repo.dart';
import 'package:tanami_capital_task/features/initializer_feature/data/repos/countries_repo_impl.dart';
import 'package:tanami_capital_task/features/market_feature/data/repos/market_repo_impl.dart';

import '../../features/dashboard_feature/data/repos/dashboard_repo.dart';
import '../../features/login_feature/data/repos/login_repo.dart';
import '../../features/login_feature/data/repos/login_repo_impl.dart';
import '../../features/market_feature/data/repos/market_repo.dart';
import '../network/network_helper.dart';
import '../network/network_helper_impl.dart';
import '../routes/nav_service.dart';
import '../storage/storage_repo.dart';
import '../storage/storage_repo_impl.dart';
import 'di.dart';

initializeRepositories() {
  di.registerLazySingleton<StorageRepo>(
    () => StorageRepoImpl(),
  );

  di.registerLazySingleton<NetworkHelper>(
    () => NetworkHelperImpl(
      storage: di(),
    ),
  );

  di.registerLazySingleton<NavService>(
    () => NavService(),
  );

  di.registerLazySingleton<CountriesRepo>(
    () => CountriesRepoImpl(),
  );

  di.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(storageRepo: di()),
  );

  di.registerLazySingleton<DashboardRepo>(
    () => DashboardRepoImpl(
      networkHelper: di(),
    ),
  );

  di.registerLazySingleton<MarketRepo>(
    () => MarketRepoImpl(
      networkHelper: di(),
    ),
  );
}
