import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../constants.dart';
import '../../models/remote/popular.dart';
import '../../models/remote/torrent.dart';

part 'api_repository.g.dart';

@RestApi(baseUrl: Constants.itapiUrl)
abstract class APIRepository {
  factory APIRepository(Dio dio, {String baseUrl}) = _APIRepository;

  @GET('/popular')
  Future<List<Popular>> getPopularTorrents();

  @GET('/popular-data')
  Future<List<Torrent>> getPopularTorrentsData(@Query('t') String title);
}
