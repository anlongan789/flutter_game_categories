import 'package:flutter/material.dart';
import 'package:flutter_games_categories/config/app_router.dart';
import 'package:flutter_games_categories/config/theme.dart';
import 'package:flutter_games_categories/screens/custom_nav_bar.dart';
import 'package:flutter_games_categories/screens/home.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, child!),
        // maxWidth: 1200,
        // minWidth: 300,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(350, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          const ResponsiveBreakpoint.resize(1100, name: DESKTOP),
        ],
      ),
      title: 'Flutter Game Categories',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter(),
    );
  }
}
