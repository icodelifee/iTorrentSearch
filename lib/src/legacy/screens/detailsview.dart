// import 'dart:ui';

// import 'package:android_intent/android_intent.dart';
// import 'package:android_intent/flag.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:itorrentapp_rebase/model/hotpicks.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:theme_provider/theme_provider.dart';

// import 'customexptile.dart' as cst;

// Color titleColor;

// class DetailsPage extends StatelessWidget {
//   final Hotpicks post;
//   DetailsPage(this.post);

//   Column blurredImage(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         ShaderMask(
//             shaderCallback: (rect) {
//               return LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [Colors.black, Colors.transparent])
//                   .createShader(Rect.fromLTRB(0, 0, rect.width, 230));
//             },
//             blendMode: BlendMode.dstIn,
//             child: CachedNetworkImage(
//               imageUrl: post.imdb.backdrop,
//               fit: BoxFit.cover,
//             )),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     titleColor = ThemeProvider.themeOf(context).data.textTheme.headline6.color;
//     return Scaffold(
//       backgroundColor: ThemeProvider.themeOf(context).data.backgroundColor,
//       body: SingleChildScrollView(
//         child: Stack(
//           children: <Widget>[
//             blurredImage(context),
//             Container(
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   topElements(context),
//                   Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             miniHeader(context, "Synopsis"),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Text(post.imdb.plot,
//                                 style: TextStyle(
//                                     color: const Color(0xFF72858B),
//                                     fontFamily: 'GilroyM',
//                                     fontSize: 14)),
//                             SizedBox(height: 10),
//                             miniHeader(context, "Torrents"),
//                             post.torrents.isEmpty
//                                 ? Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Text(
//                                       "Oops! Couldnt find torrents\nWill be updated soon. ;)",
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         fontFamily: "GilroyL",
//                                         color: titleColor,
//                                       ),
//                                     ),
//                                   )
//                                 : AnimationLimiter(
//                                     child: ListView.builder(
//                                         shrinkWrap: true,
//                                         padding: EdgeInsets.only(left: 0),
//                                         physics: BouncingScrollPhysics(),
//                                         itemCount: post.torrents.length,
//                                         itemBuilder: (context, index) {
//                                           return AnimationConfiguration.staggeredList(
//                                               position: index,
//                                               duration: const Duration(milliseconds: 900),
//                                               child: SlideAnimation(
//                                                   verticalOffset: 50.0,
//                                                   child: FadeInAnimation(
//                                                       child: torrentListTile(context, index))));
//                                         }),
//                                   ),
//                           ],
//                         )),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Text cardTitle(int index, BuildContext context) {
//     return Text(
//       post.torrents[index].title,
//       style: TextStyle(fontSize: 13, color: titleColor, fontFamily: 'GilroyB'),
//     );
//   }

//   IconButton copyBtn(int index, BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         Clipboard.setData(ClipboardData(text: Uri.decodeFull(post.torrents[index].magnet)));
//         Flushbar(
//           margin: EdgeInsets.all(8),
//           borderRadius: 8,
//           message: "Magnet Copied!",
//           flushbarStyle: FlushbarStyle.FLOATING,
//           icon: Icon(
//             Icons.link,
//             color: Colors.white,
//           ),
//           forwardAnimationCurve: Curves.decelerate,
//           reverseAnimationCurve: Curves.easeOut,
//           duration: Duration(seconds: 3),
//         )..show(context);
//       },
//       icon: Icon(
//         Icons.content_copy,
//         color: titleColor,
//       ),
//     );
//   }

//   Icon infoIcon(BuildContext context, IconData icons) {
//     return Icon(
//       icons,
//       size: 22,
//       color: titleColor,
//     );
//   }

//   Padding infoText(String text, BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
//       child: Text(
//         text,
//         style: TextStyle(color: titleColor, fontFamily: 'GilroyM'),
//       ),
//     );
//   }

//   Text miniHeader(BuildContext context, String text) {
//     return Text(
//       text,
//       style: TextStyle(color: titleColor, fontFamily: 'GilroyB', fontSize: 16),
//     );
//   }

//   Padding pickInfo(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 4.5, top: 2),
//       child: ListTile(
//         title: Text(
//           post.imdb.title,
//           style: TextStyle(color: titleColor, fontFamily: 'GilroyEB', fontSize: 30),
//         ),
//         subtitle: Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               Text(post.imdb.genre,
//                   style: TextStyle(color: titleColor, fontFamily: 'GilroyM', fontSize: 11)),
//               Text(post.imdb.runtime,
//                   style: TextStyle(color: titleColor, fontFamily: 'GilroyM', fontSize: 11))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Padding plotInfo(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, right: 10, left: 18),
//       child: Text(post.imdb.plot,
//           textAlign: TextAlign.left,
//           style: TextStyle(color: titleColor, fontSize: 15.0, fontFamily: 'GilroyM')),
//     );
//   }

//   Padding ratingText(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 4, left: 4),
//       child: Text((double.parse(post.imdb.rating)).toString(),
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontFamily: 'GilroyB',
//               fontSize: 18,
//               color: ThemeProvider.themeOf(context).data.primaryColor)),
//     );
//   }

//   IconButton shareBtn(int index, BuildContext context) {
//     return IconButton(
//       onPressed: () {},
//       icon: Icon(
//         Icons.share,
//         color: titleColor,
//       ),
//     );
//   }

//   Widget starWidget(BuildContext context) {
//     return Icon(
//       Icons.star,
//       size: 20,
//       color: ThemeProvider.themeOf(context).data.primaryColor,
//     );
//   }

//   Align titleFab(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 50, left: 20),
//         child: FloatingActionButton.extended(
//           heroTag: "torrents-fab",
//           onPressed: () {},
//           elevation: 0.0,
//           backgroundColor: ThemeProvider.themeOf(context).data.primaryColor,
//           label: Text(
//             "Torrents",
//             style: TextStyle(color: Colors.white, fontSize: 15.0, fontFamily: 'GilroyM'),
//           ),
//         ),
//       ),
//     );
//   }

//   Padding topElements(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 140, left: 20, right: 15),
//       child: Row(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//                 elevation: 6,
//                 color: Colors.transparent,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   child: Hero(
//                     tag: post.uuid,
//                     child: FancyShimmerImage(
//                         imageUrl: post.imdb.hqposter,
//                         height: 180,
//                         width: 120,
//                         boxFit: BoxFit.cover),
//                   ),
//                 )),
//           ),
//           SizedBox(width: 10),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: 100,
//               ),
//               Container(
//                 width: 200,
//                 child: Text(
//                   post.imdb.title,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(color: titleColor, fontFamily: 'GilroyB', fontSize: 22),
//                 ),
//               ),
//               post.imdb.rating.contains("N/A")
//                   ? Text("N/A",
//                       style: TextStyle(
//                           color: ThemeProvider.themeOf(context).data.accentColor,
//                           fontFamily: 'GilroyB',
//                           fontSize: 14))
//                   : Row(
//                       children: [starWidget(context), ratingText(context)],
//                     ),
//               Text(post.imdb.year + " | " + post.imdb.runtime,
//                   style: TextStyle(
//                       color: const Color(0xFF72858B), fontFamily: 'GilroyM', fontSize: 14)),
//               SizedBox(
//                 width: 190,
//                 child: Text(post.imdb.genre,
//                     overflow: TextOverflow.ellipsis,
//                     softWrap: true,
//                     style: TextStyle(
//                         color: const Color(0xFF72858B), fontFamily: 'GilroyM', fontSize: 13)),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget torrentInfo(BuildContext context, int index) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               infoIcon(context, Icons.arrow_upward),
//               infoText(post.torrents[index].seeds, context),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               infoIcon(context, Icons.arrow_downward),
//               infoText(post.torrents[index].leechs, context),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Icon(
//                 Icons.data_usage,
//                 size: 15,
//                 color: titleColor,
//               ),
//               infoText(post.torrents[index].size, context),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Card torrentListTile(BuildContext context, int index) {
//     return Card(
//       color: ThemeProvider.themeOf(context).data.cardColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
//       child: cst.ExpansionTile(
//         title: cardTitle(index, context),
//         headerBackgroundColor: ThemeProvider.themeOf(context).data.cardColor,
//         key: new GlobalKey(),
//         iconColor: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//         children: <Widget>[
//           torrentInfo(context, index),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               copyBtn(index, context),
//               shareBtn(index, context),
//               downloadButton(context, index)
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   IconButton downloadButton(BuildContext context, int index) {
//     return IconButton(
//         onPressed: () async {
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           String downloader = prefs.getString("downloader");
//           if (downloader == null) {
//             Flushbar(
//               duration: Duration(seconds: 3),
//               message: "No Default Torrent Downloader Set! Check Settings",
//               icon: Icon(
//                 Icons.error,
//                 color: Colors.grey,
//               ),
//             ).show(context);
//           } else {
//             AndroidIntent intent = AndroidIntent(
//                 action: 'action_view',
//                 data: Uri.encodeFull(post.torrents[index].magnet),
//                 flags: <int>[Flag.FLAG_ACTIVITY_CLEAR_TOP],
//                 package: downloader);
//             intent.launch();
//           }
//         },
//         icon: Icon(
//           Icons.file_download,
//           color: titleColor,
//         ));
//   }
// }
