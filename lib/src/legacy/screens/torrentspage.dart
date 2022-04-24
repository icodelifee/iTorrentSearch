// import 'package:android_intent/android_intent.dart';
// import 'package:android_intent/flag.dart';
// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:itorrentsearch/model/torrent.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:theme_provider/theme_provider.dart';

// class TorrentsPage extends StatelessWidget {
//   final Future<List<Torrent>> torrents;

//   TorrentsPage({required this.torrents});
//   Color titleColor;
//   @override
//   Widget build(BuildContext context) {
//     titleColor = ThemeProvider.themeOf(context).data.textTheme.headline6.color;
//     return SingleChildScrollView(
//       child: Container(
//           child: Column(
//         children: <Widget>[
//           FutureBuilder(
//               future: torrents,
//               builder: (BuildContext context, AsyncSnapshot<List<Torrent>> snapshot) {
//                 switch (snapshot.connectionState) {
//                   case ConnectionState.waiting:
//                     return Padding(
//                         padding: EdgeInsets.only(top: 100),
//                         child: CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation<Color>(ThemeProvider.themeOf(context).data.primaryColor),
//                         ));
//                     break;
//                   case ConnectionState.none:
//                     return searchSomethingText(context);
//                     break;
//                   default:
//                     if (snapshot.data != null || snapshot.data == []) {
//                       final List<Torrent> torrents = snapshot.data;
//                       return ListView.builder(
//                           physics: BouncingScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: torrents.length > 15 ? 15 : torrents.length,
//                           padding: EdgeInsets.only(top: 15, left: 8, right: 8),
//                           itemBuilder: (context, index) {
//                             return Container(
//                                 child: Card(
//                               elevation: 3,
//                               color: ThemeProvider.themeOf(context).data.dialogBackgroundColor,
//                               child: torrentTile(
//                                 torrents,
//                                 index,
//                                 context,
//                               ),
//                             ));
//                           });
//                     } else {
//                       return errorTextWidget(context);
//                     }
//                 }
//               }),
//         ],
//       )),
//     );
//   }

//   ListTile torrentTile(List<Torrent> torrents, int index, BuildContext context) {
//     return ListTile(
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             CopyButton(
//               titleColor: titleColor,
//               torrents: torrents[index],
//             ),
//             ShareButton(titleColor: titleColor, torrents: torrents[index]),
//             DownloadButton(titleColor: titleColor, torrents: torrents[index])
//           ],
//         ),
//         dense: true,
//         isThreeLine: true,
//         contentPadding: EdgeInsets.all(10),
//         title: torrentTitle(torrents, index, context),
//         subtitle: seedAndLeechs(context, torrents, index));
//   }

//   Text torrentTitle(List<Torrent> torrents, int index, BuildContext context) {
//     return Text(
//       torrents[index].title.trim(),
//       style: TextStyle(color: titleColor),
//     );
//   }

//   Padding searchSomethingText(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 150),
//       child: Text(
//         "Search Something!",
//         style: TextStyle(fontSize: 20.0, color: titleColor, fontFamily: 'GilroyM'),
//       ),
//     );
//   }

//   Padding errorTextWidget(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 150),
//       child: Text(
//         "!Oops, Couldn't Find Anything",
//         style: TextStyle(fontSize: 20.0, color: titleColor, fontFamily: 'GilroyM'),
//       ),
//     );
//   }

//   Column seedAndLeechs(BuildContext context, List<Torrent> torrents, int index) {
//     return Column(children: <Widget>[
//       Row(children: <Widget>[
//         Icon(
//           Icons.keyboard_arrow_up,
//           color: titleColor,
//         ),
//         Flexible(
//             child: Text(
//           torrents[index].seeds.toString(),
//           style: TextStyle(color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//           overflow: TextOverflow.ellipsis,
//         )),
//         SizedBox(
//           width: 10,
//         ),
//         Icon(
//           Icons.keyboard_arrow_down,
//           color: titleColor,
//         ),
//         Flexible(
//             child: Text(
//           torrents[index].leechs.toString(),
//           style: TextStyle(color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//           overflow: TextOverflow.ellipsis,
//         )),
//         SizedBox(
//           width: 10,
//         ),
//         Icon(
//           Icons.data_usage,
//           size: 15,
//           color: titleColor,
//         ),
//         Padding(
//           padding: EdgeInsets.only(right: 2),
//         ),
//         Text(
//           torrents[index].size.trim(),
//           style: TextStyle(color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//         )
//         // style: getTextStyle(context))
//       ]),
//       addedRow(torrents, index, context)
//     ]);
//   }

//   Row addedRow(List<Torrent> torrents, int index, context) {
//     return Row(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(right: 5),
//         ),
//         Icon(
//           Icons.date_range,
//           size: 15,
//           color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//         ),
//         Padding(
//           padding: EdgeInsets.only(right: 5),
//         ),
//         Flexible(
//             child: Text(
//           torrents[index].added,
//           overflow: TextOverflow.ellipsis,
//           style: TextStyle(color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//         ))
//       ],
//     );
//   }
// }

// class DownloadButton extends StatelessWidget {
//   const DownloadButton({Key key, @required this.titleColor, @required this.torrents}) : super(key: key);

//   final Torrent torrents;
//   final Color titleColor;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () async {
//           final SharedPreferences prefs = await SharedPreferences.getInstance();
//           final String downloader = prefs.getString("downloader");
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
//             final AndroidIntent intent = AndroidIntent(
//                 action: 'action_view',
//                 data: Uri.encodeFull(torrents.magnet),
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

// class ShareButton extends StatelessWidget {
//   const ShareButton({Key key, @required this.titleColor, @required this.torrents}) : super(key: key);

//   final Color titleColor;
//   final Torrent torrents;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {},
//       icon: Icon(Icons.share, color: titleColor),
//     );
//   }
// }

// class CopyButton extends StatelessWidget {
//   const CopyButton({Key key, @required this.titleColor, @required this.torrents}) : super(key: key);

//   final Color titleColor;
//   final Torrent torrents;

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         Clipboard.setData(ClipboardData(text: Uri.decodeFull(torrents.magnet)));
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
//         ).show(context);
//       },
//       icon: Icon(
//         Icons.content_copy,
//         color: titleColor,
//       ),
//     );
//   }
// }
