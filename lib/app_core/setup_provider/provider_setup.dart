import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tanami_capital_task/features/Home_feature/presentation/provider/home_provider.dart';
import 'package:tanami_capital_task/features/dashboard_feature/presentation/provider/dashboard_provider.dart';
import 'package:tanami_capital_task/features/initializer_feature/presentation/provider/initializer_provider.dart';
import 'package:tanami_capital_task/features/login_feature/presentation/provider/login_provider.dart';

import '../../features/market_feature/presentation/provider/market_provider.dart';
import '../../features/profile_feature/presentation/provider/profile_provider.dart';
import '../di/di.dart';
import '../locale/locale_provider.dart';

class SetupProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => InitializerProvider(
        getCountriesUseCase: di(),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LoginProvider(
        loginUseCase: di(),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => DashboardProvider(
        getDashboardDataUseCase: di(),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => MarketProvider(
        getMarketDataUseCase: di(),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => ProfileProvider(
        storageRepo: di(),
      ),
    ),
  ];
}
