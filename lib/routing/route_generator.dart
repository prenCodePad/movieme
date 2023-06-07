import 'package:flutter/material.dart';
import 'package:flutter_app/config/storage_prefs.dart';

import '../pages/pages.dart';
import 'package:flutter_app/routing/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var path = settings.name;
    String? loggedIn = StoragePrefs.getStorageValue('name');
    if (loggedIn != null) path = Routes.homeScreen;
    if (loggedIn == null) path = Routes.loginScreen;
    switch (path) {
      case Routes.loginScreen:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const LoginPage(), settings: settings);
      case Routes.homeScreen:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const HomePage(), settings: settings);
      default:
        return PageRouteBuilder(pageBuilder: (_, __, ___) => const ErrorPage(), settings: settings);
    }
  }
}
