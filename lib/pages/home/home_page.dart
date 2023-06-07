import 'package:flutter/material.dart';

import 'package:flutter_app/responsivelayout.dart';

import '../../common/common.dart';
import '../pages.dart';

class HomePage extends StatelessWidget with AppMixin {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: theme.themeBlue,
        child: const SafeArea(
          child: ResponsiveLayout(
            mobile: HomeNarrowLayout(),
            wide: HomeWideLayout(),
          ),
        ),
      ),
    );
  }
}

class HomeNarrowLayout extends StatelessWidget with AppMixin {
  const HomeNarrowLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

class HomeWideLayout extends StatelessWidget with AppMixin {
  const HomeWideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreenWide();
  }
}
