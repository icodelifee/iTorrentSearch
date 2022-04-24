// import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
// import 'package:extended_tabs/extended_tabs.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:itorrentapp_rebase/core/services/api.dart';
// import 'package:itorrentapp_rebase/core/services/suggestions.dart';
// import 'package:itorrentapp_rebase/model/torrent.dart';
// import 'package:itorrentapp_rebase/ui/torrentspage.dart';
// import 'package:theme_provider/theme_provider.dart';

// const borderRadius = const BorderRadius.all(
//   const Radius.circular(10.0),
// );
// const outlineInputBorder = OutlineInputBorder(
//     borderRadius: borderRadius, borderSide: BorderSide(color: Colors.transparent));

// class SearchPageRoute extends CupertinoPageRoute {
//   SearchPageRoute() : super(builder: (BuildContext context) => new SearchPage());

//   @override
//   Widget buildPage(
//       BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
//     return new FadeTransition(opacity: animation, child: new SearchPage());
//   }
// }

// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage>
//     with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<SearchPage> {
//   Future<List<Torrent>> limetor;
//   Future<List<Torrent>> snowfl;
//   Future<List<Torrent>> kat;
//   Future<List<Torrent>> nyaa;
//   Future<List<Torrent>> one337x;
//   Future<List<Torrent>> rarbg;
//   bool seedAsc = false;
//   bool seedDesc = false;
//   bool sizeAsc = false;
//   bool sizeDesc = false;
//   Future<List<Torrent>> sky;
//   String sort = "best";
//   int tabLength = 9;
//   bool timeAsc = false;
//   bool timeDesc = false;
//   Future<List<Torrent>> tpb;
//   Future<List<Torrent>> yts;

//   List<String> enabledWidgets = [];
//   SuggestionsBoxController _sc = SuggestionsBoxController();
//   TabController _tabController;
//   TextEditingController _tc = TextEditingController();

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   getTabController() {
//     return TabController(length: getTabs().length, vsync: this);
//   }

//   @override
//   void initState() {
//     _tabController = getTabController();
//     super.initState();
//   }

//   PreferredSize searchAppBar(BuildContext context) {
//     return PreferredSize(
//       preferredSize: Size.fromHeight(110),
//       child: AppBar(
//         elevation: 0.5,
//         bottom: customTabBar(context),
//         backgroundColor: ThemeProvider.themeOf(context).data.backgroundColor,
//         automaticallyImplyLeading: false,
//         flexibleSpace: Padding(
//           padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
//           child: typeaheadTextField(context),
//         ),
//       ),
//     );
//   }

//   Widget customTabBar(BuildContext context) {
//     return new TabBar(
//         isScrollable: true,
//         indicatorSize: TabBarIndicatorSize.tab,
//         labelColor: Colors.white,
//         controller: _tabController,
//         unselectedLabelColor: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//         indicator: bubbleIndc(context),
//         tabs: getTabs());
//   }

//   BubbleTabIndicator bubbleIndc(BuildContext context) {
//     return new BubbleTabIndicator(
//         indicatorHeight: 25.0,
//         insets: EdgeInsets.only(left: 10, right: 10),
//         indicatorColor: ThemeProvider.themeOf(context).data.primaryColor,
//         tabBarIndicatorSize: TabBarIndicatorSize.tab,
//         indicatorRadius: 5);
//   }

//   TypeAheadField typeaheadTextField(BuildContext context) {
//     final textColor = ThemeProvider.themeOf(context).data.textTheme.headline6.color;
//     final TextStyle txtStyle = TextStyle(color: textColor, fontFamily: 'GilroyM');

//     return TypeAheadField(
//         transitionBuilder: (context, suggestionsBox, animationController) => FadeTransition(
//               child: suggestionsBox,
//               opacity: CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
//             ),
//         textFieldConfiguration: TextFieldConfiguration(
//           autofocus: true,
//           controller: _tc,
//           cursorColor: ThemeProvider.themeOf(context).data.primaryColor,
//           textInputAction: TextInputAction.search,
//           onSubmitted: (val) {
//             _sc.close();
//             searchTorrents(val);
//           },
//           style: TextStyle(
//               fontSize: 15.0,
//               color: ThemeProvider.themeOf(context).data.textTheme.headline6.color,
//               fontFamily: 'GilroyM'),
//           decoration: InputDecoration(
//               prefixIcon: searchButton(context),
//               suffixIcon: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   IconButton(
//                     icon: Icon(
//                       Icons.close,
//                       color: ThemeProvider.themeOf(context).data.primaryColor,
//                       size: 20,
//                     ),
//                     onPressed: () {
//                       _tc.clear();
//                     },
//                   ),
//                   sortButton(context, textColor, txtStyle),
//                 ],
//               ),
//               fillColor: ThemeProvider.themeOf(context).data.dialogBackgroundColor,
//               hintText: "Search Torrents",
//               hintStyle: TextStyle(
//                   fontFamily: 'GilroyM', color: ThemeProvider.themeOf(context).data.indicatorColor),
//               filled: true,
//               border: outlineInputBorder,
//               enabledBorder: outlineInputBorder,
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: borderRadius,
//                 borderSide: BorderSide(color: ThemeProvider.themeOf(context).data.primaryColor),
//               ),
//               contentPadding: EdgeInsets.only(left: 15.0, top: 20)),
//         ),
//         suggestionsBoxController: _sc,
//         suggestionsCallback: (pattern) async {
//           return await SuggestionsAPI().getSuggestions(pattern);
//         },
//         noItemsFoundBuilder: (BuildContext context) {
//           return SizedBox();
//         },
//         debounceDuration: Duration(milliseconds: 500),
//         itemBuilder: (context, suggestion) {
//           return ListTile(
//               leading: Icon(Icons.search,
//                   color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//               title: Text(
//                 suggestion.toString(),
//                 style: TextStyle(
//                     fontFamily: 'GilroyM',
//                     color: ThemeProvider.themeOf(context).data.textTheme.headline6.color),
//               ));
//         },
//         suggestionsBoxDecoration: SuggestionsBoxDecoration(
//             color: ThemeProvider.themeOf(context).data.dialogBackgroundColor,
//             elevation: 5,
//             borderRadius: BorderRadius.all(Radius.circular(15))),
//         onSuggestionSelected: (suggestion) {
//           searchTorrents(suggestion);
//         });
//   }

//   IconButton sortButton(BuildContext context, Color textColor, TextStyle txtStyle) {
//     return IconButton(
//       icon: Icon(
//         Icons.sort,
//         color: ThemeProvider.themeOf(context).data.primaryColor,
//         size: 20,
//       ),
//       onPressed: () {
//         showModalBottomSheet(
//             backgroundColor: Colors.transparent,
//             context: context,
//             builder: (BuildContext ctx) => StatefulBuilder(
//                 builder: (BuildContext context, StateSetter stateSetter) => ThemeConsumer(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: ThemeProvider.themeOf(context).data.dialogBackgroundColor,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(15), topRight: Radius.circular(15)),
//                         ),
//                         // height: 150,
//                         child: Theme(
//                           data: ThemeProvider.themeOf(context).data.copyWith(
//                                 unselectedWidgetColor: textColor,
//                               ),
//                           child: Wrap(
//                             crossAxisAlignment: WrapCrossAlignment.center,
//                             children: <Widget>[
//                               AppBar(
//                                 title: Text(
//                                   "Sort Options",
//                                   style: TextStyle(fontFamily: "GilroyB", color: textColor),
//                                 ),
//                                 automaticallyImplyLeading: false,
//                                 backgroundColor: Colors.transparent,
//                                 elevation: 0,
//                               ),
//                               headerText("Seeds", txtStyle),
//                               Divider(),
//                               sortMethods(txtStyle, "Ascending", "Descending", "seeds", seedAsc,
//                                   seedDesc, stateSetter),
//                               headerText("Size", txtStyle),
//                               Divider(),
//                               sortMethods(txtStyle, "Ascending", "Descending", "size", sizeAsc,
//                                   sizeDesc, stateSetter),
//                               headerText("Time", txtStyle),
//                               Divider(),
//                               sortMethods(txtStyle, "Oldest", "Latest", "time", timeAsc, timeDesc,
//                                   stateSetter),
//                               FlatButton(
//                                   color: ThemeProvider.themeOf(context).data.accentColor,
//                                   onPressed: () {
//                                     searchTorrents(_tc.text);
//                                     Navigator.pop(context);
//                                   },
//                                   child: SizedBox(
//                                     height: 40,
//                                     width: MediaQuery.of(context).size.width,
//                                     child: Center(
//                                       child: Text(
//                                         "Apply",
//                                         style: txtStyle.copyWith(
//                                             color: Colors.white, fontFamily: "GilroyB"),
//                                       ),
//                                     ),
//                                   ))
//                             ],
//                           ),
//                         ),
//                       ),
//                     )));
//       },
//     );
//   }

//   Padding headerText(String header, TextStyle txtStyle) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 14),
//       child: Text(
//         header,
//         style: txtStyle.copyWith(fontSize: 20),
//       ),
//     );
//   }

//   Row sortMethods(TextStyle txtStyle, String text1, String text2, String sortType, bool val1,
//       bool val2, StateSetter stateSetter) {
//     return Row(
//       children: <Widget>[
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 2,
//           child: CheckboxListTile(
//             value: val1,
//             onChanged: (val) {
//               switch (sortType) {
//                 case "seeds":
//                   seedAsc = !seedAsc;
//                   sort = "seeds-asc";
//                   seedDesc = false;
//                   sizeDesc = false;
//                   timeDesc = false;
//                   sizeAsc = false;
//                   timeAsc = false;
//                   break;
//                 case "time":
//                   timeAsc = !timeAsc;
//                   sort = "time-asc";
//                   seedDesc = false;
//                   sizeDesc = false;
//                   timeDesc = false;
//                   sizeAsc = false;
//                   seedAsc = false;
//                   break;
//                 case "size":
//                   sizeAsc = !sizeAsc;
//                   sort = "size-asc";
//                   seedAsc = false;
//                   seedDesc = false;
//                   sizeDesc = false;
//                   timeDesc = false;
//                   timeAsc = false;
//                   break;
//                 default:
//               }
//               stateSetter(() {});
//             },
//             title: Text(
//               text1,
//               style: txtStyle,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: MediaQuery.of(context).size.width / 2,
//           child: CheckboxListTile(
//             value: val2,
//             onChanged: (val) {
//               switch (sortType) {
//                 case "seeds":
//                   seedDesc = val;
//                   sort = "seeds-desc";
//                   seedAsc = false;
//                   sizeDesc = false;
//                   timeDesc = false;
//                   sizeAsc = false;
//                   timeAsc = false;
//                   break;
//                 case "time":
//                   sort = "time-desc";
//                   timeDesc = val;
//                   timeAsc = false;
//                   seedDesc = false;
//                   sizeDesc = false;
//                   sizeAsc = false;
//                   seedAsc = false;
//                   break;
//                 case "size":
//                   sizeAsc = false;
//                   sort = "size-desc";
//                   seedAsc = false;
//                   seedDesc = false;
//                   sizeDesc = val;
//                   timeDesc = false;
//                   timeAsc = false;
//                   break;
//                 default:
//               }
//               stateSetter(() {});
//             },
//             title: Text(
//               text2,
//               style: txtStyle,
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   IconButton searchButton(BuildContext context) {
//     return IconButton(
//       icon: Icon(
//         Icons.search,
//         color: ThemeProvider.themeOf(context).data.primaryColor,
//         size: 25,
//       ),
//       onPressed: () {
//         _sc.close();
//         searchTorrents(_tc.text);
//       },
//     );
//   }

//   List<Widget> getWidgets(List w) {
//     List<Map> lf = [
//       {"future": sky, "name": "sky"},
//       {"future": one337x, "name": "leet"},
//       {"future": rarbg, "name": "rarbg"},
//       {"future": tpb, "name": "tpb"},
//       {"future": yts, "name": "yts"},
//       {"future": limetor, "name": "lime"},
//       {"future": kat, "name": "kat"},
//       {"future": snowfl, "name": "snowfl"},
//       {"future": nyaa, "name": "nyaa"},
//     ];
//     List defaultWidgets = <Widget>[];

//     for (Map widget in lf) {
//       if (w.contains(widget["name"]))
//         defaultWidgets.add(TorrentsPage(torrents: widget["future"]));
//       else
//         continue;
//     }

//     return defaultWidgets;
//   }

//   enableTab(String tabId) {
//     enabledWidgets.add(tabId);
//     _tabController.index = 0;
//     _tabController = getTabController();
//     setState(() {});
//   }

//   disableTab(String tabId) {
//     enabledWidgets.removeWhere((element) => element == tabId);
//     _tabController.index = 0;
//     _tabController = getTabController();
//     setState(() {});
//   }

//   searchTorrents(suggestion) async {
//     _tc.text = suggestion;
//     sky = getSky(suggestion, sort).then((value) {
//       if (value == null || value.length == 0)
//         disableTab("sky");
//       else
//         enableTab("sky");
//       return value;
//     });
//     rarbg = getTorrentAPI(suggestion, sort, "rarbg").then((value) {
//       if (value == null || value.length == 0)
//         disableTab("rarbg");
//       else
//         enableTab("rarbg");
//       return value;
//     });

//     one337x = getTorrentAPI(suggestion, sort, "1337x").then((value) {
//       if (value == null || value.length == 0)
//         disableTab("leet");
//       else
//         enableTab("leet");
//       return value;
//     });
//     kat = getTorrentAPI(suggestion, sort, "kat").then((value) {
//       if (value == null || value.length == 0)
//         disableTab("kat");
//       else
//         enableTab("kat");
//       return value;
//     });
//     tpb = getTorrentAPI(suggestion, sort, "tpb").then((value) {
//       if (value == null || value.length == 0)
//         disableTab("tpb");
//       else
//         enableTab("tpb");
//       return value;
//     });
//     yts = getTorrentAPI(suggestion, sort, "yts").then((value) {
//       if (value == null || value.length == 0)
//         disableTab("yts");
//       else
//         enableTab("yts");
//       return value;
//     });
//     limetor = getTorrentAPI(suggestion, sort, "lime").then((value) {
//       if (value == null || value.length == 0)
//         disableTab("lime");
//       else
//         enableTab("lime");
//       return value;
//     });
//     snowfl = getTorrentAPI(suggestion, sort, "snowfl").then((value) {
//       if (value == null || value.length == 0)
//         disableTab("snowfl");
//       else
//         enableTab("snowfl");
//       return value;
//     });
//     nyaa = getTorrents(suggestion, "24").then((value) {
//       if (value == null || value.length == 0)
//         disableTab("nyaa");
//       else
//         enableTab("nyaa");
//       return value;
//     });
//   }

//   getTabs() {
//     List<Map> _tabL = [
//       {"tab": Tab(text: "Skytorrents"), "name": "sky"},
//       {"tab": Tab(text: "1337X"), "name": "leet"},
//       {"tab": Tab(text: "RARBG"), "name": "rarbg"},
//       {"tab": Tab(text: "Piratebay"), "name": "tpb"},
//       {"tab": Tab(text: "YTS"), "name": "yts"},
//       {"tab": Tab(text: "Limetorrents"), "name": "lime"},
//       {"tab": Tab(text: "Kickass"), "name": "kat"},
//       {"tab": Tab(text: "Snowfl"), "name": "snowfl"},
//       {"tab": Tab(text: "Nyaa"), "name": "nyaa"},
//     ];
//     List defaultTabs = <Tab>[];
//     for (Map t in _tabL) {
//       if (enabledWidgets.contains(t['name']))
//         defaultTabs.add(t["tab"]);
//       else
//         continue;
//     }
//     return defaultTabs;
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: ThemeProvider.themeOf(context).data.backgroundColor,
//         appBar: searchAppBar(context),
//         body: ExtendedTabBarView(
//             cacheExtent: 9,
//             physics: BouncingScrollPhysics(),
//             controller: _tabController,
//             children: getWidgets(enabledWidgets)),
//       ),
//     );
//   }

//   @override
//   bool get wantKeepAlive => true;
// }
