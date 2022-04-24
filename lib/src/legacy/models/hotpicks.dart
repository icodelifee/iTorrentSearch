// import 'dart:convert';

// class Hotpicks {
//   String uuid;
//   List<Torrents> torrents;
//   Imdb imdb;

//   Hotpicks({
//     required this.uuid,
//     required this.torrents,
//     required this.imdb,
//   });

//   factory Hotpicks.fromJson(String str) => Hotpicks.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Hotpicks.fromMap(Map<String, dynamic> json) => Hotpicks(
//         uuid: json["uuid"],
//         torrents: List<Torrents>.from(json["torrents"].map((x) => Torrents.fromMap(x))),
//         imdb: Imdb.fromMap(json["imdb"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "uuid": uuid,
//         "torrents": List<dynamic>.from(torrents.map((x) => x.toMap())),
//         "imdb": imdb.toMap(),
//       };
// }

// class Imdb {
//   String id;
//   String title;
//   String year;
//   String hqposter;
//   String genre;
//   String runtime;
//   String rating;
//   String backdrop;
//   String plot;

//   Imdb({
//     required this.id,
//     required this.title,
//     required this.year,
//     required this.hqposter,
//     required this.genre,
//     required this.runtime,
//     required this.rating,
//     required this.backdrop,
//     required this.plot,
//   });

//   factory Imdb.fromJson(String str) => Imdb.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Imdb.fromMap(Map<String, dynamic> json) => Imdb(
//         id: json["id"],
//         title: json["title"],
//         year: json["year"],
//         hqposter: json["hqposter"],
//         genre: json["genre"],
//         runtime: json["runtime"],
//         rating: json["rating"],
//         backdrop: json["backdrop"],
//         plot: json["plot"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "title": title,
//         "year": year,
//         "hqposter": hqposter,
//         "genre": genre,
//         "runtime": runtime,
//         "rating": rating,
//         "backdrop": backdrop,
//         "plot": plot,
//       };
// }

// class Torrents {
//   String title;
//   String magnet;
//   String size;
//   String seeds;
//   String leechs;

//   Torrents({
//     required this.title,
//     required this.magnet,
//     required this.size,
//     required this.seeds,
//     required this.leechs,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'magnet': magnet,
//       'size': size,
//       'seeds': seeds,
//       'leechs': leechs,
//     };
//   }

//   factory Torrents.fromMap(Map<String, dynamic> map) {
//     return Torrents(
//       title: map['title'],
//       magnet: map['magnet'],
//       size: map['size'],
//       seeds: map['seeds'],
//       leechs: map['leechs'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Torrents.fromJson(String source) => Torrents.fromMap(json.decode(source));
// }
