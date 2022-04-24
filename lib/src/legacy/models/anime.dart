// import 'dart:convert';

// class Anime {
//   String title;
//   String hqposter;
//   String plot;
//   List<Ep> eps;

//   Anime({
//     required this.title,
//     required this.hqposter,
//     required this.plot,
//     required this.eps,
//   });

//   factory Anime.fromJson(String str) => Anime.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Anime.fromMap(Map<String, dynamic> json) => Anime(
//         title: json["title"],
//         hqposter: json["hqposter"],
//         plot: json["plot"],
//         eps: List<Ep>.from(json["eps"].map((x) => Ep.fromMap(x))),
//       );

//   Map<String, dynamic> toMap() => {
//         "title": title,
//         "hqposter": hqposter,
//         "plot": plot,
//         "eps": List<dynamic>.from(eps.map((x) => x.toMap())),
//       };
// }

// class Ep {
//   String title;
//   String the1080P;
//   String the720P;
//   String the480P;

//   Ep({
//     required this.title,
//     required this.the1080P,
//     required this.the720P,
//     required this.the480P,
//   });

//   factory Ep.fromJson(String str) => Ep.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Ep.fromMap(Map<String, dynamic> json) => Ep(
//         title: json["title"],
//         the1080P: json["1080p"],
//         the720P: json["720p"],
//         the480P: json["480p"],
//       );

//   Map<String, dynamic> toMap() => {
//         "title": title,
//         "1080p": the1080P,
//         "720p": the720P,
//         "480p": the480P,
//       };
// }
