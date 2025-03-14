import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'app_core/locale/locale_constants.dart';
import 'app_core/locale/locale_provider.dart';
import 'app_core/routes/app_routes.dart';
import 'app_core/routes/nav_service.dart';
import 'app_core/setup_provider/provider_setup.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        useInheritedMediaQuery: true,
        builder: (_, child) {
          return MultiProvider(
              providers: SetupProviders.providers,
              builder: (context, child) {
                return GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    debugShowMaterialGrid: false,
                    theme: ThemeData(
                        useMaterial3: false,
                        fontFamily: GoogleFonts.almarai().fontFamily),
                    navigatorKey: GoTo.navKey,
                    locale: context.watch<LocaleProvider>().locale,
                    supportedLocales: supportedLocale,
                    localizationsDelegates: localizationDelegates,
                    onGenerateRoute: AppRoutes.generateRoute,
                  ),
                );
              });
        });
  }
}
