import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../models/remote/popular.dart';
import '../../models/remote/torrent.dart';

part 'api_repository.g.dart';

@Injectable(as: _APIRepository)
@RestApi()
abstract class APIRepository {
  @factoryMethod
  factory APIRepository(Dio dio, {@Named('BaseUrl') String baseUrl}) = _APIRepository;

  @GET('/popular')
  Future<List<Popular>> getPopularTorrents();

  @GET('/popular-data')
  Future<List<Torrent>> getPopularTorrentsData(@Query('t') String title);

  @GET('/1337x')
  Future<List<Torrent>> search1337x(@Query('q') String query);

  @GET('/kat')
  Future<List<Torrent>> searchKat(@Query('q') String query);

  @GET('/snowfl')
  Future<List<Torrent>> searchSnowfl(@Query('q') String query);

  @GET('/tpb')
  Future<List<Torrent>> searchTPB(@Query('q') String query);

  @GET('/lime')
  Future<List<Torrent>> searchLime(@Query('q') String query);

  @GET('/rarbg')
  Future<List<Torrent>> searchRarbg(@Query('q') String query);
}
