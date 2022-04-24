// import 'dart:async';

// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:itorrentapp_rebase/constants.dart';
// import 'package:itorrentapp_rebase/controller/homepage.dart';
// import 'package:itorrentapp_rebase/controller/locator.dart';
// import 'package:package_info/package_info.dart';
// import 'package:theme_provider/theme_provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// class AppInfoTile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () async {
//         PackageInfo packageInfo = await PackageInfo.fromPlatform();
//         String version = packageInfo.version;
//         String buildno = packageInfo.buildNumber;
//         showModalBottomSheet(
//             backgroundColor: ThemeProvider.themeOf(context).data.dialogBackgroundColor,
//             shape: RoundedRectangleBorder(
//               borderRadius:
//                   BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//             ),
//             context: context,
//             builder: (context) {
//               return Container(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: Container(
//                         width: 45,
//                         height: 5,
//                         decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: BorderRadius.all(Radius.circular(12.0))),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 30),
//                       child: Align(
//                           alignment: Alignment.center,
//                           child: Image.asset(
//                             "assets/icon/icon.png",
//                             scale: 2.5,
//                           )),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 25.0),
//                       child: Text("iTorrent Search",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontFamily: 'GilroyB',
//                               fontSize: 20,
//                               color:
//                                   ThemeProvider.themeOf(context).data.textTheme.headline6.color)),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(5.0),
//                       child: Text("Version " + version + "+" + buildno,
//                           textAlign: TextAlign.center,
//                           style:
//                               TextStyle(color: Colors.grey, fontSize: 15.0, fontFamily: 'GilroyM')),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 2, bottom: 20),
//                       child: Text("A privacy-respecting, customizable torrent search engine.",
//                           textAlign: TextAlign.center,
//                           style:
//                               TextStyle(color: Colors.grey, fontSize: 14.0, fontFamily: 'GilroyM')),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     )
//                   ],
//                 ),
//               );
//             });
//       },
//       trailing: Icon(
//         Icons.info_outline,
//         color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//       ),
//       title: Text("App Info",
//           style: TextStyle(
//               fontFamily: 'GilroyB',
//               fontSize: 17,
//               color: ThemeProvider.themeOf(context).data.textTheme.headline6.color)),
//     );
//   }
// }

// class PrivacyPolicyTile extends StatelessWidget {
//   const PrivacyPolicyTile({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         launch("https://gistpreview.github.io/?a6fbf502fc6922c4317a75c15749852c");
//       },
//       trailing: Icon(
//         Icons.verified_user,
//         color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//       ),
//       title: Text("Privacy Policy",
//           style: TextStyle(
//               fontFamily: 'GilroyB',
//               fontSize: 17,
//               color: ThemeProvider.themeOf(context).data.textTheme.headline6.color)),
//     );
//   }
// }

// class RateAndReview extends StatelessWidget {
//   const RateAndReview({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("Rate And Review This App",
//           style: TextStyle(
//               fontFamily: 'GilroyB',
//               fontSize: 17,
//               color: ThemeProvider.themeOf(context).data.textTheme.headline6.color)),
//       trailing: Icon(
//         Icons.star_half,
//         color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//       ),
//       onTap: () {
//         launch("market://details?id=com.icodelife.itorrentsearch");
//       },
//     );
//   }
// }

// class SettingsPageRoute extends CupertinoPageRoute {
//   final bool ads;
//   SettingsPageRoute({this.ads}) : super(builder: (BuildContext context) => new SettingsPage());

//   @override
//   Widget buildPage(
//       BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
//     return new FadeTransition(opacity: animation, child: new SettingsPage());
//   }
// }

// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   StreamSubscription _subscription;

//   @override
//   void initState() {
//     super.initState();
//     asyncInitState();
//   }

//   void asyncInitState() async {
//     _subscription = getIt<HomePageState>()
//         .instance
//         .purchaseUpdatedStream
//         .listen((data) => {print("PURCHASED")});
//   }

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     getThemeName(context) {
//       if (ThemeProvider.themeOf(context).id == "white_theme")
//         return "White";
//       else if (ThemeProvider.themeOf(context).id == "dark_theme")
//         return "Black";
//       else
//         return "Dark";
//     }

//     return ThemeConsumer(
//       child: Scaffold(
//         backgroundColor: ThemeProvider.themeOf(context).data.backgroundColor,
//         appBar: customAppBar(context),
//         body: Container(
//           height: double.maxFinite,
//           padding: EdgeInsets.all(10),
//           child: Column(
//             children: <Widget>[
//               adFreeTile(context),
//               Divider(),
//               changeThemeTile(context, getThemeName),
//               Divider(),
//               DefaultTorrentClient(),
//               Divider(),
//               PrivacyPolicyTile(),
//               Divider(),
//               RateAndReview(),
//               Divider(),
//               SupportChatTile(),
//               Divider(),
//               AppInfoTile(),
//               Divider(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Visibility adFreeTile(BuildContext context) {
//     return Visibility(
//       visible: !getIt<HomePageState>().noAds,
//       child: ListTile(
//         title: Text("Get Adfree",
//             style: TextStyle(
//                 fontFamily: 'GilroyB',
//                 fontSize: 17,
//                 color: ThemeProvider.themeOf(context).data.textTheme.headline6.color)),
//         trailing: Icon(
//           Icons.not_interested,
//           color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//         ),
//         onTap: () async {
//           Set<String> ids = Set.from(['adfree']);
//           ProductDetailsResponse response =
//               await getIt<HomePageState>().instance.queryProductDetails(ids);
//           final PurchaseParam purchaseParam =
//               PurchaseParam(productDetails: response.productDetails[0]);
//           bool purchased =
//               await getIt<HomePageState>().instance.buyNonConsumable(purchaseParam: purchaseParam);
//           if (purchased == true) {
//             Flushbar(
//               margin: EdgeInsets.all(8),
//               borderRadius: 8,
//               message: "Thanks for purchasing Ad free!",
//               flushbarStyle: FlushbarStyle.FLOATING,
//               icon: Icon(
//                 Icons.link,
//                 color: Colors.white,
//               ),
//               forwardAnimationCurve: Curves.decelerate,
//               reverseAnimationCurve: Curves.easeOut,
//               onStatusChanged: (FlushbarStatus stat) {
//                 if (stat == FlushbarStatus.DISMISSED) {
//                   getIt<HomePageState>().noAds = true;
//                 }
//               },
//               duration: Duration(seconds: 3),
//             )..show(context);
//           }
//         },
//       ),
//     );
//   }

//   ListTile changeThemeTile(BuildContext context, String getThemeName(dynamic context)) {
//     return ListTile(
//       onTap: () {
//         ThemeProvider.controllerOf(context).nextTheme();
//       },
//       title: Text("Change Theme",
//           style: TextStyle(
//               fontFamily: 'GilroyB',
//               fontSize: 17,
//               color: ThemeProvider.themeOf(context).data.textTheme.headline6.color)),
//       trailing: Text(getThemeName(context),
//           style: TextStyle(
//               fontFamily: 'GilroyM',
//               fontSize: 17,
//               color: ThemeProvider.themeOf(context).data.textTheme.headline6.color)),
//     );
//   }

//   AppBar customAppBar(BuildContext context) {
//     return new AppBar(
//       automaticallyImplyLeading: false,
//       title: Text(
//         "Settings",
//         style: TextStyle(
//             fontFamily: 'GilroyB',
//             fontSize: 30,
//             color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//       ),
//       elevation: 0,
//       backgroundColor: ThemeProvider.themeOf(context).data.backgroundColor,
//     );
//   }

//   Icon tickIcon(BuildContext context) {
//     return Icon(
//       Icons.done,
//       color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//     );
//   }
// }

// class DefaultTorrentClient extends StatelessWidget {
//   const DefaultTorrentClient({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("Default Torrent Downloader",
//           style: TextStyle(
//               fontFamily: 'GilroyB',
//               fontSize: 17,
//               color: ThemeProvider.themeOf(context).data.textTheme.headline6.color)),
//       trailing: Icon(
//         Icons.file_download,
//         color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//       ),
//       onTap: () async {},
//     );
//   }
// }

// class SupportChatTile extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text("Join Support Group",
//           style: TextStyle(
//               fontFamily: 'GilroyB',
//               fontSize: 17,
//               color: ThemeProvider.themeOf(context).data.textTheme.headline6.color)),
//       trailing: Icon(
//         Icons.send,
//         color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//       ),
//       onTap: () {
//         launch(Constants.chatUrl);
//       },
//     );
//   }
// }
