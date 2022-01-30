import 'package:dio/dio.dart';

import '../../constants.dart';

Dio get dioInstance {
  final client = Dio();
  client.options.headers['Authorization'] = Constants.auth;
  return client;
}
