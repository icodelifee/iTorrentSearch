import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/colors.dart';
import '../../../config/font_weight.dart';
import '../../../domain/enums/search_provider.dart';
import '../../../presentation/widgets/default_progress_indicator.dart';
import '../../../presentation/widgets/listview_fade.dart';
import '../../../presentation/widgets/reuseables.dart';
import '../../../presentation/widgets/torrent_info_tile.dart';
import '../providers/search_provider.dart';

class SearchList extends StatefulHookConsumerWidget {
  const SearchList({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SearchList> createState() => _SearchListState();
}

class _SearchListState extends ConsumerState<SearchList> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchStateProvider);

    return state.when(
      initial: () => empty,
      loading: () => const DefaultProgressIndicator.center(),
      data: (data) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 56,
                child: Theme(
                  data: ThemeData(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                  child: TabBar(
                    unselectedLabelColor: Colors.white,
                    labelColor: CColors.mainColor,
                    padding: EdgeInsets.zero,
                    indicator: ContainerTabIndicator(
                      color: CColors.mainColor.withOpacity(0.3),
                      radius: const BorderRadius.all(Radius.circular(12.0)),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    ),
                    tabs: SearchProvider.values.map((e) {
                      return Text(
                        e.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            body: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: TabBarView(
                physics: const ClampingScrollPhysics(),
                children: [
                  for (final provider in SearchProvider.values)
                    ListViewFadeWidget(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        itemCount: data[provider]!.length,
                        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
                          position: index,
                          duration: 200.milliseconds,
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: TorrentInfoTile(torrent: data[provider]![index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
      error: (error) => Text(error.toString()),
    );
  }
}
