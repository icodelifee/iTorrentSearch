// import 'package:fancy_shimmer_image/defaults.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:theme_provider/theme_provider.dart';

// class ShimmerList extends StatelessWidget {
//   const ShimmerList({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.transparent,
//         margin: EdgeInsets.symmetric(vertical: 10.0),
//         height: 220,
//         child: ListView.builder(
//           padding: EdgeInsets.only(left: 10, right: 10),
//           scrollDirection: Axis.horizontal,
//           itemCount: 5,
//           itemBuilder: (BuildContext context, int index) {
//             return Shimmer.fromColors(
//                 baseColor: defaultShimmerBackColor,
//                 highlightColor: defaultShimmerHighlightColor,
//                 child: Card(
//                   color: Colors.transparent,
//                   elevation: 0.0,
//                   child: SizedBox(
//                       height: 180,
//                       width: 140,
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         child: Container(color: ThemeProvider.themeOf(context).data.dialogBackgroundColor),
//                       )),
//                 ));
//           },
//         ));
//   }
// }
