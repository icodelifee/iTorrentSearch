import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

import '../di.dart';
import '../gen/fonts.gen.dart';
import 'config/colors.dart';
import 'legacy/screens/homepage/homepage.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iTorrent Search',
      theme: ThemeData(
        useMaterial3: true,
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
