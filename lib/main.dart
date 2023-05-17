import 'package:ecyzhi_flutter/config/theme_data.dart';
import 'package:ecyzhi_flutter/home.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EcyZhi',
      theme: CustomTheme.lightThemeData,
      darkTheme: CustomTheme.darkThemeData,
      themeMode: ThemeMode.light,
      home: const Home(),
    );
  }
}
