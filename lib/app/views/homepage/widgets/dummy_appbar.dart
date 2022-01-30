import 'package:flutter/material.dart';
import 'package:itorrentsearch/app/config/font_weight.dart';
import 'package:itorrentsearch/app/shared/frosted_glass.dart';
import 'package:itorrentsearch/gen/assets.gen.dart';

class DummyAppBar extends StatelessWidget {
  const DummyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      border: Border.all(color: Colors.transparent),
      height: 56,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Assets.icon.search.image(
              width: 22,
              height: 22,
              color: Colors.white.withOpacity(0.2),
            ),
            const SizedBox(width: 20),
            Text(
              'Search...',
              style: TextStyle(
                fontWeight: regular,
                fontSize: 18,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
