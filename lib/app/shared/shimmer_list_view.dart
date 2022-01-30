import 'package:flutter/material.dart';

import 'frosted_glass.dart';

class ShimmerListView extends StatefulWidget {
  const ShimmerListView({
    required this.height,
    Key? key,
    this.itemCount,
  }) : super(key: key);

  final double height;
  final int? itemCount;

  const ShimmerListView.torrentList({Key? key}) : this(key: key, height: 84);

  @override
  State<ShimmerListView> createState() => _ShimmerListViewState();
}

class _ShimmerListViewState extends State<ShimmerListView> with SingleTickerProviderStateMixin {
  late final animationController =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
  late final _animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // This determines the total count of item
        // by checking the available space(height) by the item height
        final itemCount = widget.itemCount ?? (constraints.maxHeight ~/ widget.height);

        return ListView.builder(
          itemCount: itemCount,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemBuilder: (context, index) {
            return FadeTransition(
              opacity: _animation,
              child: GlassContainer(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: widget.height,
                width: double.infinity,
              ),
            );
          },
        );
      },
    );
  }
}
