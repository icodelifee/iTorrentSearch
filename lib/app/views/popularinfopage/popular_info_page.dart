import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/colors.dart';
import '../../config/font_weight.dart';
import '../../data/models/remote/popular.dart';
import '../../shared/frosted_glass.dart';
import '../../shared/reuseables.dart';
import 'providers/popular_info_provider.dart';
import 'widgets/backdrop_image.dart';
import 'widgets/media_info_widget.dart';
import 'widgets/overview_widget.dart';
import 'widgets/popular_torrents_list.dart';
import 'widgets/poster_image.dart';
import 'widgets/rating_widget.dart';

class PopularInfoPage extends ConsumerStatefulWidget {
  const PopularInfoPage({Key? key, required this.popular}) : super(key: key);

  final Popular popular;

  @override
  ConsumerState<PopularInfoPage> createState() => _PopularInfoPageState();
}

class _PopularInfoPageState extends ConsumerState<PopularInfoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.read(currentImdbIdProvider.state).state = widget.popular.imdbId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.red,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
        body: Stack(
          children: [
            PopularInfoBackdropImage(posterPath: widget.popular.posterPath),
            ListView(
              shrinkWrap: true,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 100,
                  curve: Curves.easeInOutCubic,
                  child: FadeInAnimation(
                    curve: Curves.easeInOutCubic,
                    child: widget,
                  ),
                ),
                children: [
                  Center(
                    child: PopularInfoPosterImage(
                      imageUrl: widget.popular.posterPath,
                      placeHolder: const GlassContainer(width: 200, height: 300),
                      width: 200,
                    ),
                  ),
                  sizedH32,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      widget.popular.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24, fontWeight: semiBold),
                    ),
                  ),
                  sizedH20,
                  MediaInfoWidget(popular: widget.popular),
                  sizedH20,
                  RatingWidget(rating: widget.popular.voteAverage),
                  sizedH20,
                  OverviewWidget(overview: widget.popular.overview),
                  const SizedBox(height: 120),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _ShowTorrentButton(popular: widget.popular),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShowTorrentButton extends StatefulWidget {
  const _ShowTorrentButton({
    Key? key,
    required this.popular,
  }) : super(key: key);

  final Popular popular;

  @override
  State<_ShowTorrentButton> createState() => _ShowTorrentButtonState();
}

class _ShowTorrentButtonState extends State<_ShowTorrentButton> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    initController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void initController() {
    controller = BottomSheet.createAnimationController(this)
      ..duration = const Duration(milliseconds: 500)
      ..reverseDuration = const Duration(milliseconds: 300);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlassContainer(
        border: Border.all(color: Colors.transparent),
        child: MaterialButton(
          onPressed: () {
            showModalBottomSheet<PopularTorrentsList>(
              context: context,
              elevation: 0,
              transitionAnimationController: controller,
              backgroundColor: Colors.transparent,
              builder: (context) => PopularTorrentsList(imdbId: widget.popular.imdbId),
            ).whenComplete(initController);
          },
          height: 56,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: CColors.mainColor.withOpacity(0.3),
          child: const Text(
            'Show Torrents',
            style: TextStyle(color: CColors.mainColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
