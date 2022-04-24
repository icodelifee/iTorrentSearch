import 'dart:math';

import 'package:flutter/material.dart';

import '../../../config/font_weight.dart';
import '../../../data/models/remote/popular.dart';
import '../../../utils/mins_to_hours.dart';

class MediaInfoWidget extends StatelessWidget {
  const MediaInfoWidget({
    Key? key,
    required this.popular,
  }) : super(key: key);

  final Popular popular;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          runSpacing: 10,
          spacing: 10,
          children: [
            Text(
              popular.releaseDate.year.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: medium,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            if (popular.genres.isNotEmpty)
              Text(
                popular.genres.sublist(0, min(3, popular.genres.length - 1)).join(', '),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: medium, color: Colors.grey),
              ),
            Text(
              minsToHours(Duration(minutes: popular.runtime)),
              style: const TextStyle(fontSize: 16, fontWeight: medium, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
