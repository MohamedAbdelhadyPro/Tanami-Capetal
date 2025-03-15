import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/locale/locale_constants.dart';
import 'package:tanami_capital_task/app_core/routes/nav_service.dart';
import 'package:tanami_capital_task/app_core/storage/storage_repo.dart';
import 'package:tanami_capital_task/features/initializer_feature/domain/usecases/get_countries_use_case.dart';
import 'package:tanami_capital_task/features/initializer_feature/presentation/provider/initializer_provider.dart';
import 'package:tanami_capital_task/features/login_feature/domain/usecases/login_use_case.dart';
import 'package:tanami_capital_task/features/login_feature/presentation/login_screen.dart';
import 'package:tanami_capital_task/features/login_feature/presentation/provider/login_provider.dart';

import 'login_screen_test.mocks.dart';

@GenerateMocks([LoginUseCase, NavService, StorageRepo, GetCountriesUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final getIt = GetIt.instance;

  setUpAll(() {
    getIt.reset();

    final mockLoginUseCase = MockLoginUseCase();
    final mockNavService = MockNavService();
    final mockStorageRepo = MockStorageRepo();
    final mockGetCountriesUseCase = MockGetCountriesUseCase();

    getIt.registerSingleton<NavService>(mockNavService);
    getIt.registerSingleton<StorageRepo>(mockStorageRepo);
    getIt.registerSingleton<LoginUseCase>(mockLoginUseCase);
    getIt.registerSingleton<GetCountriesUseCase>(mockGetCountriesUseCase);
  });

  testWidgets('Login UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
          designSize: const Size(414, 896),
          minTextAdapt: true,
          useInheritedMediaQuery: true,
          builder: (_, child) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                    create: (_) =>
                        LoginProvider(loginUseCase: getIt<LoginUseCase>())),
                ChangeNotifierProvider(
                    create: (_) => InitializerProvider(
                        getCountriesUseCase: getIt<GetCountriesUseCase>())),
              ],
              child: MaterialApp(
                home: LoginScreen(),
                debugShowCheckedModeBanner: false,
                debugShowMaterialGrid: false,
                locale: Locale("en"),
                supportedLocales: supportedLocale,
                localizationsDelegates: localizationDelegates,
              ),
            );
          }),
    );

    await tester.pumpAndSettle();

    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, '+97330303030');
    await tester.enterText(find.byType(TextField).last, 'Tanami@123');

    await tester.tap(find.text('LOGIN'));
    await tester.pump();

    expect(find.text('Incorrect password. Please try again.'), findsNothing);
  });
}
