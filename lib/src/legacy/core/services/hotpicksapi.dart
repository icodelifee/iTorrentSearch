// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:itorrentsearch/model/anime.dart';
// import 'package:itorrentsearch/model/hotpicks.dart';

// import '../../constants.dart';

// Future<List<Hotpicks>> getRecentsTorrents() async {
//   List<Hotpicks> recents = [];
//   String url = "${Constants.hotpicks}recents";
//   Dio dio = new Dio();
//   dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);
//   Response res = await dio.get(
//     url,
//     options: buildCacheOptions(Duration(hours: 3), maxStale: Duration(hours: 10)),
//   );
//   final cleanMap = jsonDecode(jsonEncode(res.data));
//   for (var recent in cleanMap) recents.add(Hotpicks.fromMap(recent));
//   recents.removeWhere((element) => element.imdb.title == null);
//   return recents;
// }

// Future<List<Hotpicks>> getMoviesTorrents() async {
//   List<Hotpicks> movies = [];
//   String url = "${Constants.hotpicks}movies";
//   Dio dio = new Dio();
//   dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);
//   Response res = await dio.get(
//     url,
//     options: buildCacheOptions(
//       Duration(hours: 3),
//       maxStale: Duration(hours: 10),
//     ),
//   );
//   for (var recent in res.data) movies.add(Hotpicks.fromMap(recent));
//   movies.removeWhere((element) => element.imdb.title == null);
//   return movies;
// }

// Future<List<Hotpicks>> getSeriesTorrents() async {
//   List<Hotpicks> series = [];
//   String url = "${Constants.hotpicks}series";
//   Dio dio = new Dio();
//   dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);
//   Response res = await dio.get(
//     url,
//     options: buildCacheOptions(
//       Duration(hours: 3),
//       maxStale: Duration(hours: 10),
//     ),
//   );
//   for (var recent in res.data) series.add(Hotpicks.fromMap(recent));
//   series.removeWhere((element) => element.imdb.title == null);
//   return series;
// }

// Future<List<Anime>> getAnimeTorrents() async {
//   List<Anime> animes = [];
//   String url = "${Constants.hotpicks}animes";
//   Dio dio = new Dio();
//   dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl: url)).interceptor);
//   Response res = await dio.get(
//     url,
//     options: buildCacheOptions(
//       Duration(hours: 3),
//       maxStale: Duration(hours: 10),
//     ),
//   );
//   for (var recent in res.data) animes.add(Anime.fromMap(recent));
//   return animes;
// }
