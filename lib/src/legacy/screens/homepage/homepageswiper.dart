// import 'package:fancy_shimmer_image/defaults.dart';
// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:itorrentapp_rebase/controller/homepage.dart';
// import 'package:itorrentapp_rebase/controller/locator.dart';
// import 'package:itorrentapp_rebase/model/hotpicks.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:itorrentapp_rebase/ui/detailsview.dart';

// class RecentTorrentsSwiper extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {

//     return FutureBuilder(
//       future: getIt<HomePageState>().recents,
//       builder: (BuildContext context, AsyncSnapshot<List<Hotpicks>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done)
//           return SizedBox(
//             height: 200,
//             child: new Swiper(
//               itemWidth: 300.0,
//               onTap: (index) {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             DetailsPage(snapshot.data[index])));
//               },
//               itemBuilder: (BuildContext context, int index) {
//                 return Card(
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   child: Stack(
//                     fit: StackFit.passthrough,
//                     children: <Widget>[
//                       FancyShimmerImage(
//                         imageUrl: snapshot.data[index].imdb.backdrop,
//                         boxFit: BoxFit.cover,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 130),
//                         child: Container(
//                           alignment: Alignment.bottomCenter,
//                           height: 30,
//                           color: Colors.black45,
//                           // width: MediaQuery.of(context).size.width,
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20),
//                             child: ListTile(
//                               title: Text(
//                                 snapshot.data[index].imdb.title,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontFamily: 'GilroyEB'),
//                               ),
//                               trailing: Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   Icon(
//                                     Icons.star_half,
//                                     color: Colors.white,
//                                     size: 18,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(top: 3, left: 5),
//                                     child: Text(
//                                         snapshot.data[index].imdb.rating,
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 15,
//                                             fontFamily: 'GilroyM')),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 5,
//                   margin: EdgeInsets.all(8),
//                 );
//               },
//               itemCount: 10,
//               viewportFraction: 0.98,
//               scale: 0.8,
//               autoplay: true,
//               fade: 0.5,
//             ),
//           );
//         else
//           return Shimmer.fromColors(
//             baseColor: defaultShimmerBackColor,
//             highlightColor: defaultShimmerHighlightColor,
//             child: SizedBox(
//                 height: 200,
//                 child: Card(
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 130),
//                     child: Container(
//                       alignment: Alignment.bottomCenter,
//                       height: 200,
//                       color: Colors.black45,
//                     ),
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 5,
//                   margin: EdgeInsets.all(8),
//                 )),
//           );
//       },
//     );
//   }
// }
