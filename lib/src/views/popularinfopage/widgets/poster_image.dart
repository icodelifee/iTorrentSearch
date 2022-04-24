import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PopularInfoPosterImage extends StatelessWidget {
  const PopularInfoPosterImage({
    required this.imageUrl,
    required this.placeHolder,
    required this.width,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final Widget placeHolder;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => placeHolder,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.medium,
        ),
      ),
    );
  }
}
