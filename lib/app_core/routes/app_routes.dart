import 'package:flutter/material.dart';
import 'package:tanami_capital_task/features/login_feature/presentation/login_screen.dart';
import 'package:tanami_capital_task/features/market_feature/presentation/view_pdf_page.dart';

import '../../features/home_feature/presentation/home_screen.dart';
import '../../features/initializer_feature/presentation/initializer_screen.dart';
import '../widgets/empty_screens_widgets/server_error_screen.dart';

class AppRoutes {
  static const initializer = '/';
  static const loginScreen = '/loginScreen';
  static const homeScreen = '/homeScreen';
  static const viewPdfPage = '/ViewPdfPage';
  static const serverErrorScreen = '/serverErrorScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case initializer:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const InitializerScreen(),
            transitionDuration: Duration.zero);
      case loginScreen:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => LoginScreen());
      case homeScreen:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen());
      case viewPdfPage:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => ViewPdfPage());
      case serverErrorScreen:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => const ServerErrorScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: SafeArea(
              child: Center(child: Text('Route Error')),
            ),
          ),
        );
    }
  }
}
