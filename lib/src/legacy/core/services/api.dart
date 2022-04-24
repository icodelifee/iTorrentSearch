// import 'dart:convert';

// import "package:dio/dio.dart";
// import 'package:itorrentsearch/model/torrent.dart';

// import '../../constants.dart';

// Future<List<Torrent>?> getTorrents(String? query, String provider) async {
//   if (query == null || query.isEmpty) return null;
//   var url =
//       "${Constants.apiUrl}query=$query&sort=0&category=0&page=0&adult=0&key=halyoa&concurrent=0&provider_ids[]=$provider";
//   Response res;
//   try {
//     res = await Dio().get(url);
//   } catch (e) {
//     return null;
//   }
//   if (res.statusCode != 200) return null;
//   List<Torrent>? torrents = [];
//   var json = jsonDecode(res.data);
//   if (json.length <= 0) return null;
//   for (var torrent in json["results"]) {
//     torrents.add(Torrent.fromJson(torrent));
//   }
//   return torrents;
// }

// Future<List<Torrent>?> getTorrentAPI(String? query, String sort, String provider) async {
//   if (query == null || query.isEmpty) return null;
//   List so = getSort(sort);
//   var url = "${Constants.itapiUrl}$provider?q=$query&s=${so[0]}&o=${so[1]}";
//   Response res = await Dio().get(url, options: Options(headers: <String, String>{'authorization': Constants.auth}));
//   if (res.statusCode != 200) return null;
//   List<Torrent>? torrents = [];
//   if (res.data.length <= 0) return null;
//   for (var torrent in res.data) torrents.add(Torrent.fromJson(torrent));
//   return torrents;
// }

// Future<List<Torrent>?> getSky(String? query, String sort) async {
//   if (query == null || query.isEmpty) return null;
//   var url =
//       "${Constants.apiUrl}query=$query&sort=${getSkySort(sort)}&category=0&page=0&adult=0&key=halyoa&concurrent=0&provider_ids[]=32";
//   Response res = await Dio().get(url);
//   if (res.statusCode != 200) return null;
//   List<Torrent>? torrents = [];
//   var json = jsonDecode(res.data);
//   if (json.length <= 0) return null;
//   for (var torrent in json["results"]) {
//     torrents.add(Torrent.fromJson(torrent));
//   }
//   if (sort == "seeds-asc")
//     torrents.sort((a, b) => a.seeds.compareTo(b.seeds));
//   else if (sort == "time-asc") torrents = torrents.reversed.toList();
//   return torrents;
// }

// getSkySort(String sort) {
//   switch (sort) {
//     case "seeds-asc":
//       return "1";
//     case "seeds-desc":
//       return "1";
//     case "time-asc":
//       return "4";
//     case "time-desc":
//       return "4";
//     default:
//       return 0;
//   }
// }

// getSort(String sort) {
//   switch (sort) {
//     case "seeds-asc":
//       return ["1", "0"];
//     case "seeds-desc":
//       return ["1", "1"];
//     case "time-asc":
//       return ["2", "0"];
//     case "time-desc":
//       return ["2", "1"];
//     case "size-asc":
//       return ["3", "0"];
//     case "size-desc":
//       return ["3", "1"];
//     default:
//       return ["0", "0"];
//   }
// }
