import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopularInfoBackdropImage extends StatelessWidget {
  const PopularInfoBackdropImage({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          foregroundDecoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
          child: CachedNetworkImage(
            imageUrl: posterPath,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
        ),
      ),
    );
  }
}
