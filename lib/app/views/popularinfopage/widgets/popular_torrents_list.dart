import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';

import '../../../config/font_weight.dart';
import '../../../shared/empty.dart';
import '../../../shared/frosted_glass.dart';
import '../../../shared/listview_fade.dart';
import '../../../shared/shimmer_list_view.dart';
import '../../../shared/torrent_info_tile.dart';
import '../../../utils/extensions/torrent_x.dart';
import '../providers/popular_info_provider.dart';

class PopularTorrentsList extends ConsumerStatefulWidget {
  const PopularTorrentsList({
    required this.imdbId,
    Key? key,
  }) : super(key: key);

  final String imdbId;

  static void showModal({required String imdbId}) {
    OneContext().showModalBottomSheet<PopularTorrentsList>(
      elevation: 0,
      backgroundColor: Colors.transparent,
      builder: (_) => PopularTorrentsList(imdbId: imdbId),
    );
  }

  @override
  ConsumerState<PopularTorrentsList> createState() => _PopularTorrentsListState();
}

class _PopularTorrentsListState extends ConsumerState<PopularTorrentsList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.read(popularTorrentsStateProvider.notifier).fetch(imdbId: widget.imdbId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final torrents = ref.watch(popularTorrentsStateProvider);

    return GlassContainer(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      border: Border.all(color: Colors.transparent),
      height: OneContext().mediaQuery.size.height * 0.5,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                width: 70,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
              ),
              const SizedBox(height: 20),
              torrents.when(
                initial: () => empty,
                loading: () => const Expanded(child: ShimmerListView.torrentList()),
                data: (data) {
                  if (data.isNotEmpty) {
                    return Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: ListViewFadeWidget(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: data.length,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            itemBuilder: (BuildContext context, int index) {
                              return data[index].isNotEmpty ? TorrentInfoTile(torrent: data[index]) : empty;
                            },
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Expanded(
                      child: Center(
                        child: Text(
                          'Sorry, No torrents available!',
                          style: TextStyle(
                            fontWeight: medium,
                            letterSpacing: 0.7,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  }
                },
                error: (error) => Text(error.toString()),
              ),
            ],
          );
        },
      ),
    );
  }
}
