import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/manager/routes_manager.dart';
import 'package:rick_morty_flutter/src/manager/theme_manager.dart';
import 'package:rick_morty_flutter/src/pages/character/character_detail.dart';
import 'package:rick_morty_flutter/src/pages/home/home.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp instance = MyApp._internal();
  factory MyApp() => instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      initialRoute: Routes.homeRoute,
      routes: {
        Routes.homeRoute: (BuildContext context) => const HomeView(),
        Routes.detailRoute: (BuildContext context) =>
            const CharacterDetailView()
      },
    );
  }
}
