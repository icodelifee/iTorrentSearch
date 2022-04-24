import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

import '../di.dart';
import '../gen/fonts.gen.dart';
import 'config/colors.dart';
import 'views/homepage/pages/homepage.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iTorrent Search',
      theme: ThemeData(
        primaryColor: CColors.mainColor,
        brightness: Brightness.dark,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: CColors.mainColor,
        ),
        fontFamily: FontFamily.poppins,
        backgroundColor: CColors.backgroundColor,
        scaffoldBackgroundColor: CColors.backgroundColor,
      ),
      color: CColors.mainColor,
      builder: di<OneContext>().builder,
      navigatorKey: di<OneContext>().key,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
