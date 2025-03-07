import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.onHover,
    this.padding,
    this.backgroundColor,
    this.shape,
    this.child,
  });
  final void Function()? onPressed;
  final void Function(bool)? onHover;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final OutlinedBorder? shape;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onHover: onHover,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(padding),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        shape: WidgetStateProperty.all(shape),
      ),
      child: child,
    );
  }
}
