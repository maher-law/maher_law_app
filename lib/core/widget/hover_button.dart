import 'dart:async';

import 'package:flutter/material.dart';

/// main class
class HoverButton extends StatefulWidget {
  /// {@macro hover_widget}
  const HoverButton({
    required this.child,
    this.onTap,
    super.key,
    required this.endScale,
    this.onHoverStart,
    this.onHoverEnd,
  });

  final double endScale;

  /// widget to be wrapped
  final Widget child;

  /// optional onTap functionality
  final void Function()? onTap;
  final void Function()? onHoverStart, onHoverEnd;

  @override
  HoverWidgetState createState() => HoverWidgetState();
}

/// main state
class HoverWidgetState extends State<HoverButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// observe user taps
  double widgetScale = 1;

  /// observe user hover
  double hoverScale = 1;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 50,
      ),
      lowerBound: .9,
      value: 1,
    )..addListener(() {
        setState(() {
          widgetScale = _controller.value;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (f) {
        setState(() {
          hoverScale = widget.endScale;
        });
        widget.onHoverStart?.call();
      },
      onExit: (f) {
        setState(() => hoverScale = 1);
        widget.onHoverEnd?.call();
      },
      child: Listener(
        onPointerDown: (event) async {
          // await _controller.reverse();
        },
        onPointerUp: (event) async {
          Timer(const Duration(milliseconds: 150), () {
            // if (!_controller.isDismissed) {
            // _controller.forward();
            // }
          });
          widget.onTap?.call();
        },
        child: Transform.scale(
          scale: widgetScale,
          child: AnimatedScale(
            scale: hoverScale,
            curve: Curves.bounceInOut,
            duration: const Duration(milliseconds: 100),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
