import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'di.dart';
import 'src/app.dart';
import 'src/config/colors.dart';

void main() {
  // InAppPurchaseConnection.enablePendingPurchases();
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: CColors.backgroundColor, // navigation bar color
    statusBarColor: CColors.backgroundColor, // status bar color
  ));

  configureDependencies();

  runApp(const ProviderScope(child: App()));
}
