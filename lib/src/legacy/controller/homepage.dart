// import 'package:flutter/foundation.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:itorrentapp_rebase/core/services/hotpicksapi.dart';
// import 'package:itorrentapp_rebase/model/anime.dart';
// import 'package:itorrentapp_rebase/model/hotpicks.dart';

// class HomePageState extends ChangeNotifier {
//   late Future<List<Hotpicks>> recents;
//   Future<List<Hotpicks>> series;
//   Future<List<Hotpicks>> movies;
//   Future<List<Anime>> animes;
//   bool _noAds = false;

//   bool get noAds => _noAds;

//   set noAds(bool noAds) {
//     _noAds = noAds;
//     notifyListeners();
//   }

//   InAppPurchaseConnection instance = InAppPurchaseConnection.instance;

//   Future checkIAP() async {
//     final bool available = await instance.isAvailable();
//     if (available) {
//       final QueryPurchaseDetailsResponse response =
//           await instance.queryPastPurchases();
//       if (response.pastPurchases.length > 0) {
//         noAds = true;
//         if (response.pastPurchases[0].pendingCompletePurchase) {
//           instance.completePurchase(response.pastPurchases[0]);
//         }
//         notifyListeners();
//       }
//     } else {
//       throw Exception("Store not available");
//     }
//     return;
//   }

//   getAllRecents() {
//     recents = getRecentsTorrents();
//     movies = getMoviesTorrents();
//     series = getSeriesTorrents();
//     animes = getAnimeTorrents();
//     notifyListeners();
//   }
// }
