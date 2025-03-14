import 'package:tanami_capital_task/features/initializer_feature/domain/usecases/get_countries_use_case.dart';
import 'package:tanami_capital_task/features/login_feature/domain/usecases/login_use_case.dart';

import '../../features/dashboard_feature/domain/usecases/get_dashboard_data_use_case.dart';
import '../../features/market_feature/domain/usecases/get_market_data_use_case.dart';
import 'di.dart';

initializeUseCases() {
  di.registerLazySingleton<GetCountriesUseCase>(
    () => GetCountriesUseCase(countriesRepo: di()),
  );

  di.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(loginRepo: di()),
  );

  di.registerLazySingleton<GetDashboardDataUseCase>(
    () => GetDashboardDataUseCase(dashboardRepo: di()),
  );

  di.registerLazySingleton<GetMarketDataUseCase>(
    () => GetMarketDataUseCase(marketRepo: di()),
  );
}
