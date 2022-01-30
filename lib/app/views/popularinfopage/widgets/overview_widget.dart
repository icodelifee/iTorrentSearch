import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../config/colors.dart';
import '../../../config/font_weight.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({
    required this.overview,
    Key? key,
  }) : super(key: key);

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ReadMoreText(
        overview,
        colorClickableText: CColors.accentColor,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 16, fontWeight: regular, color: Colors.white.withOpacity(0.9)),
      ),
    );
  }
}
