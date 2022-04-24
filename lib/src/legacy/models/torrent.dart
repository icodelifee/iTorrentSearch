// import 'dart:convert';

// class Torrent {
//   String title;
//   String magnet;
//   String size;
//   String added;
//   String seeds;
//   String leechs;

//   Torrent({
//     required this.title,
//     required this.magnet,
//     required this.size,
//     required this.added,
//     required this.seeds,
//     required this.leechs,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'magnet': magnet,
//       'size': size,
//       'added': added,
//       'seeds': seeds,
//       'leechs': leechs,
//     };
//   }

//   factory Torrent.fromMap(Map<String, dynamic> map) {
//     return Torrent(
//       title: map['title'],
//       magnet: map['magnet'],
//       size: map['size'],
//       added: map['added'],
//       seeds: map['seeds'],
//       leechs: map['leechs'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Torrent.fromJson(String source) => Torrent.fromMap(json.decode(source));
// }
