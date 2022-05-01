import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class AnimatedIndexedStack extends StatefulWidget {
  const AnimatedIndexedStack({
    this.children = const <Widget>[],
    this.index = 0,
    this.reverse = false,
    this.duration,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.sizing = StackFit.loose,
    this.axis = Axis.horizontal,
    this.offsetValue = 20,
    this.curve = Curves.easeInOutCubic,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;
  final int index;
  final bool reverse;
  final Duration? duration;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final StackFit sizing;
  final Axis axis;
  final double offsetValue;
  final Curve curve;

  @override
  _AnimatedIndexedStackState createState() => _AnimatedIndexedStackState();
}

class _AnimatedIndexedStackState extends State<AnimatedIndexedStack> with AnimationMixin {
  late AnimationController inController;
  late AnimationController outController;

  late Animation<double> inOpacity;
  late Animation<double> outOpacity;
  late Animation<Offset> inOffset;
  late Animation<Offset> outOffset;
  late int index;
  late Duration duration;

  bool exiting = false;

  @override
  void initState() {
    inController = createController();
    outController = createController();

    duration = widget.duration ?? 1.seconds;
    inOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: inController, curve: widget.curve));
    outOpacity = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(parent: outController, curve: widget.curve));

    inOffset = Tween(begin: _getOffsetByAxis(-widget.offsetValue), end: Offset.zero).animate(inController);
    outOffset = Tween(begin: Offset.zero, end: _getOffsetByAxis(widget.offsetValue)).animate(outController);

    index = widget.index;

    inController.play(duration: duration);
    super.initState();
  }

  @override
  void didUpdateWidget(AnimatedIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != index) {
      exiting = true;
      outController.play(duration: duration).then((_) {
        inController.reset();
        outController.reset();
        setState(() {
          index = widget.index;
          exiting = false;
        });
        inController.play(duration: duration);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _offset = exiting ? outOffset.value : inOffset.value;
    _offset *= widget.reverse ? -1 : 1;

    return Transform.translate(
      offset: _offset,
      child: Opacity(
        opacity: exiting ? outOpacity.value : inOpacity.value,
        child: IndexedStack(
          index: index,
          alignment: widget.alignment,
          sizing: widget.sizing,
          textDirection: widget.textDirection,
          children: [
            for (int i = 0; i < widget.children.length; i++)
              if (i == index) widget.children[i] else ExcludeFocus(child: widget.children[i]),
          ],
        ),
      ),
    );
  }

  Offset _getOffsetByAxis(double offsetValue) {
    return widget.axis == Axis.horizontal ? Offset(offsetValue, 0) : Offset(0, offsetValue);
  }
}
