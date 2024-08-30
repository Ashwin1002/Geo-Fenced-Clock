import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:geo_fenced_clock/src/clock/clock.dart';

class FlipClockButton extends StatefulWidget {
  const FlipClockButton({
    super.key,
    required this.child,
    required this.countdown,
    required this.totalDuration,
    this.onTap,
  });

  final Widget child;
  final Duration countdown;
  final Duration totalDuration;
  final VoidCallback? onTap;

  @override
  State<FlipClockButton> createState() => _FlipClockButtonState();
}

class _FlipClockButtonState extends State<FlipClockButton> {
  var _isRunning = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (dragDetail) {
        if (dragDetail.velocity.pixelsPerSecond.dx < 1) {
          debugPrint('right');
        } else {
          debugPrint('left');
        }
        setState(() {
          _isRunning = !_isRunning;
        });
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: _transitionBuilder,
        switchInCurve: Curves.ease,
        switchOutCurve: Curves.ease.flipped,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _isRunning
            ? ClockInOutButton.clockOut(
                countdownSeconds: widget.countdown,
                durationEnd: widget.totalDuration,
                onTap: widget.onTap,
              )
            : widget.child,
      ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnimation = Tween(begin: math.pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnimation,
      child: widget,
      builder: (context, widget) {
        final isFront = ValueKey(_isRunning) == widget!.key;
        final rotationY = isFront
            ? rotateAnimation.value
            : math.min(rotateAnimation.value, math.pi * 0.5);
        return Transform(
          transform: Matrix4.rotationY(rotationY)..setEntry(3, 0, 0),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }
}
