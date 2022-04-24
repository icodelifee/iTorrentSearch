import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

import '../../../../gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.search),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: OneContext().mediaQuery.size.height * 0.1),
              const Text(
                'iTorrent Search',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "Let's find your torrents",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Expanded(
                  //   child: GlassContainer(
                  //     border: Border.all(color: Colors.transparent),
                  //     height: 56,
                  //     child: Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 18),
                  //       child: Row(
                  //         children: [
                  //           Assets.icon.search.image(
                  //             width: 22,
                  //             height: 22,
                  //             color: Colors.white.withOpacity(0.2),
                  //           ),
                  //           const SizedBox(width: 20),
                  //           Text(
                  //             'Search...',
                  //             style: TextStyle(
                  //               fontWeight: regular,
                  //               fontSize: 18,
                  //               color: Colors.white.withOpacity(0.2),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28, right: 8),
                    child: Assets.icon.settings.image(height: 32),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class HorizontalListView extends StatelessWidget {
//   const HorizontalListView({Key key, @required this.dSnapShot}) : super(key: key);
//   final Future<List<Hotpicks>> dSnapShot;

//   void navigatetodetail(ctx, Hotpicks data) {
//     Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => DetailsPage(data)));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: dSnapShot,
//       builder: (BuildContext context, AsyncSnapshot<List<Hotpicks>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
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
//                           tag: snapshot.data[index].uuid,
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.all(Radius.circular(10)),
//                               child: FancyShimmerImage(
//                                 errorWidget: Image.network(
//                                   "https://66.media.tumblr.com/f5816b4514c3f38a53838c27c1175be0/tumblr_n1fankRShL1tq0jfno1_1280.jpg",
//                                   fit: BoxFit.cover,
//                                 ),
//                                 imageUrl: snapshot.data[index].imdb.hqposter ??
//                                     "https://66.media.tumblr.com/f5816b4514c3f38a53838c27c1175be0/tumblr_n1fankRShL1tq0jfno1_1280.jpg",
//                                 boxFit: BoxFit.cover,
//                               )),
//                         ),
//                       )),
//                   onTap: () {
//                     navigatetodetail(context, snapshot.data[index]);
//                   },
//                 );
//               },
//             ),
//           );
//         } else {
//           return ShimmerList();
//         }
//       },
//     );
//   }
// }

// class ListHeader extends StatelessWidget {
//   const ListHeader(this._header);

//   final String _header;

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.topLeft,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 18, top: 10),
//         child: Text(
//           _header,
//           textAlign: TextAlign.left,
//           style: TextStyle(color: Theme.of(context).textTheme.headline6.color, fontSize: 20.0, fontFamily: 'GilroyM'),
//         ),
//       ),
//     );
//   }
// }
