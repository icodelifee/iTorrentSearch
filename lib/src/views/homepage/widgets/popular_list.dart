// ignore_for_file: require_trailing_commas

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';

import '../../../config/colors.dart';
import '../../../data/models/remote/popular.dart';
import '../../../presentation/widgets/frosted_glass.dart';
import '../../../presentation/widgets/grid_loading_shimmer.dart';
import '../../../presentation/widgets/listview_fade.dart';
import '../../../utils/extensions/to_poster_url.dart';
import '../../popularinfopage/popular_info_page.dart';
import '../providers/popular_provider.dart';

class PopularList extends ConsumerStatefulWidget {
  const PopularList({Key? key}) : super(key: key);

  @override
  ConsumerState<PopularList> createState() => _PopularListState();
}

class _PopularListState extends ConsumerState<PopularList> {
  @override
  void initState() {
    super.initState();
    ref.read(popularStateProvider.notifier).fetchPopular();
  }

  @override
  Widget build(BuildContext context) {
    final popularState = ref.watch(popularStateProvider);

    return popularState.when(
      loading: () => const GridLoadingShimmer(),
      error: (error) => Text(
        error.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      initial: () => const SizedBox(),
      data: (data) {
        return RefreshIndicator(
          backgroundColor: CColors.accentColor.withOpacity(0.3),
          color: CColors.accentColor,
          onRefresh: () async {
            await ref.read(popularStateProvider.notifier).fetchPopular(refresh: true);
          },
          child: ListViewFadeWidget(
            child: AnimationLimiter(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 250,
                ),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: InkWell(
                            onTap: () => _navigateToPopular(data[index]),
                            child: CachedNetworkImage(
                              imageUrl: data[index].posterPath.toPosterUrl,
                              placeholder: (context, url) => const GlassContainer(),
                              // ignore: avoid_annotating_with_dynamic
                              errorWidget: (context, url, dynamic _) => const Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToPopular(Popular data) {
    OneContext().push<CupertinoPageRoute>(
      CupertinoPageRoute(builder: (BuildContext context) => PopularInfoPage(popular: data)),
    );
  }
}
