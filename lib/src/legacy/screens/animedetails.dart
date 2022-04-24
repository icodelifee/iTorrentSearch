// import 'dart:ui';

// import 'package:android_intent/android_intent.dart';
// import 'package:android_intent/flag.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:itorrentsearch/model/anime.dart';
// import 'package:theme_provider/theme_provider.dart';

// class AnimeDetails extends StatelessWidget {
//   const AnimeDetails(this.post);
//   final Anime post;

//   Card torrentListTile(BuildContext context, int index) {
//     return Card(
//       color: ThemeProvider.themeOf(context).data.cardColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
//       child: ListTile(
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             copyBtn(index, context),
//             shareBtn(index, context),
//             streamBtn(context, index),
//             downloadButton(context, index)
//           ],
//         ),
//         // dense: false,
//         contentPadding: EdgeInsets.all(10),
//         title: cardTitle(index, context),
//       ),
//     );
//   }

//   Widget downloadButton(BuildContext context, int index) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(100),
//       onTap: () async {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         String downloader = prefs.getString("downloader");
//         String magnet;
//         await showDialog(
//             context: context,
//             builder: (context) => ThemeConsumer(
//                   child: SimpleDialog(
//                     title: Text("Select Quality"),
//                     children: [
//                       FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             magnet = post.eps[index].the1080P;
//                           },
//                           child: Text(
//                             "1080p",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontFamily: 'GilroyR',
//                                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//                           )),
//                       FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             magnet = post.eps[index].the720P;
//                           },
//                           child: Text(
//                             "720p",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontFamily: 'GilroyR',
//                                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//                           )),
//                       FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             magnet = post.eps[index].the480P;
//                           },
//                           child: Text(
//                             "480p",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontFamily: 'GilroyR',
//                                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//                           ))
//                     ],
//                   ),
//                 ));
//         if (downloader == null) {
//           Flushbar(
//             duration: Duration(seconds: 3),
//             message: "No Default Torrent Downloader Set! Check Settings",
//             icon: Icon(
//               Icons.error,
//               color: Colors.grey,
//             ),
//           ).show(context);
//         } else {
//           AndroidIntent intent = AndroidIntent(
//               action: 'action_view',
//               data: Uri.encodeFull(magnet),
//               flags: <int>[Flag.FLAG_ACTIVITY_CLEAR_TOP],
//               package: downloader);
//           intent.launch();
//         }
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Icon(
//           Icons.file_download,
//           color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//         ),
//       ),
//     );
//   }

//   Text cardTitle(int index, BuildContext context) {
//     return Text(
//       post.eps[index].title,
//       style: TextStyle(
//           fontSize: 13, color: ThemeProvider.themeOf(context).data.textTheme.headline6.color, fontFamily: 'GilroyB'),
//     );
//   }

//   Widget copyBtn(int index, BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(100),
//       onTap: () async {
//         await showDialog(
//             context: context,
//             builder: (context) => ThemeConsumer(
//                   child: SimpleDialog(
//                     title: Text("Select Quality"),
//                     children: [
//                       FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             Clipboard.setData(ClipboardData(text: Uri.decodeFull(post.eps[index].the1080P)));
//                           },
//                           child: Text(
//                             "1080p",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontFamily: 'GilroyR',
//                                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//                           )),
//                       FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             Clipboard.setData(ClipboardData(text: Uri.decodeFull(post.eps[index].the720P)));
//                           },
//                           child: Text(
//                             "720p",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontFamily: 'GilroyR',
//                                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//                           )),
//                       FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             Clipboard.setData(ClipboardData(text: Uri.decodeFull(post.eps[index].the480P)));
//                           },
//                           child: Text(
//                             "480p",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontFamily: 'GilroyR',
//                                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//                           ))
//                     ],
//                   ),
//                 ));

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
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Icon(
//           Icons.content_copy,
//           color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//         ),
//       ),
//     );
//   }

//   Icon infoIcon(BuildContext context, IconData icons) {
//     return Icon(
//       icons,
//       size: 22,
//       color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//     );
//   }

//   Text infoText(String text, BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(color: ThemeProvider.themeOf(context).data.textTheme.headline6.color, fontFamily: 'GilroyM'),
//     );
//   }

//   Widget shareBtn(int index, BuildContext context) {
//     return InkWell(
//       onTap: () {
//         showDialog(
//             context: context,
//             builder: (context) => ThemeConsumer(
//                   child: SimpleDialog(
//                     title: Text("Select Quality"),
//                     children: [
//                       FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             "1080p",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontFamily: 'GilroyR',
//                                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//                           )),
//                       FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             "720p",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontFamily: 'GilroyR',
//                                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//                           )),
//                       FlatButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: Text(
//                             "480p",
//                             style: TextStyle(
//                                 fontSize: 25,
//                                 fontFamily: 'GilroyR',
//                                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//                           ))
//                     ],
//                   ),
//                 ));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Icon(
//           Icons.share,
//           color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//         ),
//       ),
//       borderRadius: BorderRadius.circular(100),
//     );
//   }

//   Widget streamBtn(BuildContext context, int index) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(100),
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (context) => ThemeConsumer(
//             child: SimpleDialog(
//               title: Text("Select Quality"),
//               children: [],
//             ),
//           ),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Icon(
//           Icons.play_circle_outline,
//           color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//         ),
//       ),
//     );
//   }

//   Text miniHeader(BuildContext context, String text) {
//     return Text(
//       text,
//       style: TextStyle(
//           color: ThemeProvider.themeOf(context).data.textTheme.headline6.color, fontFamily: 'GilroyB', fontSize: 16),
//     );
//   }

//   Container topElements(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 50),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Card(
//               elevation: 6,
//               color: Colors.transparent,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 child: Hero(
//                   tag: post.title,
//                   child: FancyShimmerImage(imageUrl: post.hqposter, height: 180, width: 120, boxFit: BoxFit.cover),
//                 ),
//               )),
//           Padding(
//             padding: const EdgeInsets.only(top: 10),
//             child: Text(
//               post.title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//                   fontFamily: 'GilroyB',
//                   fontSize: 22),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ThemeProvider.themeOf(context).data.backgroundColor,
//       body: SingleChildScrollView(
//         child: Stack(
//           children: <Widget>[
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
//                             Text(post.plot,
//                                 style: TextStyle(color: const Color(0xFF72858B), fontFamily: 'GilroyM', fontSize: 14)),
//                             SizedBox(
//                               height: 8,
//                             ),
//                             miniHeader(context, "Torrents"),
//                             post.eps.isEmpty
//                                 ? Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Text(
//                                       "Oops! Couldnt find torrents\nWill be updated soon. ;)",
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                         fontFamily: "GilroyL",
//                                         color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//                                       ),
//                                     ),
//                                   )
//                                 : AnimationLimiter(
//                                     child: ListView.builder(
//                                         scrollDirection: Axis.vertical,
//                                         shrinkWrap: true,
//                                         padding: EdgeInsets.only(top: 8),
//                                         physics: BouncingScrollPhysics(),
//                                         itemCount: post.eps.length,
//                                         itemBuilder: (context, index) {
//                                           return AnimationConfiguration.staggeredList(
//                                               position: index,
//                                               duration: const Duration(milliseconds: 900),
//                                               child: SlideAnimation(
//                                                   verticalOffset: 100.0,
//                                                   child: FadeInAnimation(child: torrentListTile(context, index))));
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
// }
