import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'frosted_glass.dart';

class GridLoadingShimmer extends StatefulWidget {
  const GridLoadingShimmer({
    Key? key,
  }) : super(key: key);

  @override
  State<GridLoadingShimmer> createState() => _GridLoadingShimmerState();
}

class _GridLoadingShimmerState extends State<GridLoadingShimmer> with SingleTickerProviderStateMixin {
  late final pulsatingController = AnimationController(
    vsync: this,
    duration: 1.seconds,
  )..repeat(reverse: true);

  @override
  void dispose() {
    pulsatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 250,
      ),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 500),
          columnCount: 2,
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: FadeTransition(
                opacity: pulsatingController,
                child: const GlassContainer(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
