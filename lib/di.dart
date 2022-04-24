import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:one_context/one_context.dart';

import 'di.config.dart';
import 'src/config/constants.dart';

final di = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(di);

@module
abstract class RegisterModules {
  @Named('BaseUrl')
  String get baseUrl => Constants.apiUrl;

  @lazySingleton
  Dio get dio => Dio()..options.headers['Authorization'] = Constants.auth;

  @singleton
  OneContext get oneContext => OneContext();
}