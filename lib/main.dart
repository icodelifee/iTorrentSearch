import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';

import 'di.dart';
import 'gen/fonts.gen.dart';
import 'src/config/colors.dart';
import 'src/views/homepage/pages/homepage.dart';

void main() {
  // InAppPurchaseConnection.enablePendingPurchases();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  configureDependencies();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
