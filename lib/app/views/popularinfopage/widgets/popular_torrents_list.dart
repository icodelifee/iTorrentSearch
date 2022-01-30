import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';

import '../../../config/colors.dart';
import '../../../config/font_weight.dart';
import '../../../data/models/remote/torrent.dart';
import '../../../shared/empty.dart';
import '../../../shared/frosted_glass.dart';
import '../../../shared/listview_fade.dart';
import '../../../shared/reuseables.dart';
import '../../../shared/shimmer_list_view.dart';
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
                              return data[index].isNotEmpty
                                  ? _TorrentInfoTile(torrent: data[index])
                                  : empty;
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

class _TorrentInfoTile extends StatefulWidget {
  const _TorrentInfoTile({
    required this.torrent,
    Key? key,
  }) : super(key: key);

  final Torrent torrent;

  @override
  State<_TorrentInfoTile> createState() => _TorrentInfoTileState();
}

class _TorrentInfoTileState extends State<_TorrentInfoTile> {
  bool isCopied = false;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.torrent.title),
                  sizedH8,
                  AnimatedCrossFade(
                    firstChild: SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 8,
                        children: [
                          _InfoChip(
                            icon: Icons.file_download,
                            text: widget.torrent.size,
                          ),
                          _InfoChip(
                            icon: Icons.arrow_circle_up_rounded,
                            text: widget.torrent.seeds,
                          ),
                          _InfoChip(
                            icon: Icons.arrow_circle_down_outlined,
                            text: widget.torrent.leechs,
                          ),
                        ],
                      ),
                    ),
                    secondChild: const Chip(
                      avatar: Icon(Icons.link),
                      label: Text('Magnet Copied to Clipboard'),
                    ),
                    crossFadeState: isCopied ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: 200.milliseconds,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: widget.torrent.magnet));
                setState(() => isCopied = true);
                Future.delayed(
                  const Duration(milliseconds: 1500),
                  () => setState(() => isCopied = false),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.text,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: CColors.mainColor.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: CColors.mainColor),
          sizedW4,
          Text(
            text,
            style: const TextStyle(
              color: CColors.mainColor,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
