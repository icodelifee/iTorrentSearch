// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';

// class AnimeListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: getIt<HomePageState>().animes,
//       builder: (BuildContext context, AsyncSnapshot<List<Anime>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done)
//           return Container(
//             color: Colors.transparent,
//             margin: EdgeInsets.symmetric(vertical: 10.0),
//             height: 220,
//             child: ListView.builder(
//               padding: EdgeInsets.only(left: 10, right: 10),
//               scrollDirection: Axis.horizontal,
//               itemCount: snapshot.data.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   child: Card(
//                       color: Colors.transparent,
//                       elevation: 0.0,
//                       child: SizedBox(
//                         height: 180,
//                         width: 140,
//                         child: Hero(
//                           tag: snapshot.data[index].title,
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.all(Radius.circular(10)),
//                               child: FancyShimmerImage(
//                                 imageUrl: snapshot.data[index].hqposter,
//                                 boxFit: BoxFit.cover,
//                               )),
//                         ),
//                       )),
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (ctx) => AnimeDetails(snapshot.data[index])));
//                   },
//                 );
//               },
//             ),
//           );
//         else
//           return ShimmerList();
//       },
//     );
//   }
// }
