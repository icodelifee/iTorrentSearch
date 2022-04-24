import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../config/font_weight.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    required this.rating,
    Key? key,
  }) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingStars(
          value: rating,
          valueLabelVisibility: false,
          maxValue: 10,
          starSpacing: 4,
          starOffColor: Colors.grey,
        ),
        const SizedBox(width: 12),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$rating',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.yellow),
              ),
              const TextSpan(
                text: ' / 10',
                style: TextStyle(fontSize: 14, fontWeight: medium, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
