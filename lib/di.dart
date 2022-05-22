import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:one_context/one_context.dart';

import 'di.config.dart';

final di = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(di);

@module
abstract class RegisterModules {
  @Named('BaseUrl')
  String get baseUrl => dotenv.env['API_URL'] ?? '';

  @lazySingleton
  Dio get dio =>
      Dio()..options.headers['Authorization'] = "Basic ${base64Encode(utf8.encode(dotenv.env['API_AUTH'] ?? ''))}";

  @singleton
  OneContext get oneContext => OneContext();
}
