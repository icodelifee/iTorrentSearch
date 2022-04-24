import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/colors.dart';
import '../../config/font_weight.dart';
import '../../data/models/remote/torrent.dart';
import 'frosted_glass.dart';
import 'reuseables.dart';

class TorrentInfoTile extends StatefulWidget {
  const TorrentInfoTile({
    required this.torrent,
    Key? key,
  }) : super(key: key);

  final Torrent torrent;

  @override
  State<TorrentInfoTile> createState() => _TorrentInfoTileState();
}

class _TorrentInfoTileState extends State<TorrentInfoTile> {
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
                  Text(widget.torrent.title, style: const TextStyle(fontWeight: medium)),
                  sizedH16,
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
