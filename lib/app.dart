import 'package:flutter/material.dart';
import 'package:flutter_games_categories/config/app_router.dart';
import 'package:flutter_games_categories/config/theme.dart';
import 'package:flutter_games_categories/screens/custom_nav_bar.dart';
import 'package:flutter_games_categories/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter(),
    );
  }
}
