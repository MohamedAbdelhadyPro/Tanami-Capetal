import 'package:flutter/material.dart';

import '../di/di.dart';

NavService get GoTo {
  return di<NavService>();
}

class NavService {
  String _currentRoute = '';

  bool isCurrent(String newRoute) {
    return newRoute == _currentRoute;
  }

  void setCurrent(String newRoute) {
    _currentRoute = newRoute;
  }

  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    setCurrent(routeName);
    return navKey.currentState?.pushNamed(routeName, arguments: arguments) ??
        Future.value();
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    setCurrent(routeName);
    return navKey.currentState
            ?.pushReplacementNamed(routeName, arguments: arguments) ??
        Future.value();
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) {
    setCurrent(routeName);
    if (navKey.currentState != null) {
      return navKey.currentState!.pushNamedAndRemoveUntil(
          routeName, (route) => false,
          arguments: arguments);
    }
    return Future.value();
  }

  Future<dynamic> push(Widget screen) {
    return navKey.currentState!.push(
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  Future<dynamic> pushAndRemoveUntil(Widget screen) {
    return navKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen), (route) => false);
  }

  void pop() {
    if (canPop()) {
      return navKey.currentState?.pop();
    }
  }

  bool canPop() {
    return navKey.currentState?.canPop() ?? false;
  }
}
