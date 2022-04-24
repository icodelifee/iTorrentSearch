import 'package:flutter/material.dart';

class DefaultProgressIndicator extends StatelessWidget {
  const DefaultProgressIndicator({
    Key? key,
    this.isCenter = false,
  }) : super(key: key);

  const DefaultProgressIndicator.center({
    Key? key,
  }) : this(key: key, isCenter: true);

  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    const progressIndicator = CircularProgressIndicator.adaptive(
      valueColor: AlwaysStoppedAnimation(Colors.white),
    );

    return isCenter ? const Center(child: progressIndicator) : progressIndicator;
  }
}
