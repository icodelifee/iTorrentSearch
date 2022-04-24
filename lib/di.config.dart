// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'di.dart' as _i5;
import 'src/data/repository/remote/api_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModules = _$RegisterModules();
  gh.lazySingleton<_i3.Dio>(() => registerModules.dio);
  gh.factory<String>(() => registerModules.baseUrl, instanceName: 'BaseUrl');
  gh.factory<_i4.APIRepository>(() => _i4.APIRepository(get<_i3.Dio>(),
      baseUrl: get<String>(instanceName: 'BaseUrl')));
  return get;
}

class _$RegisterModules extends _i5.RegisterModules {}
