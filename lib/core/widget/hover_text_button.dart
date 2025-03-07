import 'package:flutter/material.dart';

class HoverTextButton extends StatefulWidget {
  const HoverTextButton({
    super.key,
    this.onPressed,
    this.inactiveColor,
    required this.text,
    required this.activeColor,
    required this.style,
    this.isCurrentScreen = false,
    this.activeStyle,
  });

  final GestureTapCallback? onPressed;
  final String text;
  final Color activeColor;
  final TextStyle style;
  final TextStyle? activeStyle;
  final Color? inactiveColor;
  final bool isCurrentScreen;

  @override
  State<HoverTextButton> createState() => _HoverTextButtonState();
}

class _HoverTextButtonState extends State<HoverTextButton> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
          onPressed: widget.onPressed,
          onHover: (value) {
            setState(() {
              isActive = value;
            });
          },
          child: Text(
            widget.text,
            style: isActive
                ? widget.activeStyle ??
                    widget.style.copyWith(
                      color: isActive || widget.isCurrentScreen
                          ? widget.activeColor
                          : widget.inactiveColor,
                    )
                : widget.style.copyWith(
                    color: isActive || widget.isCurrentScreen
                        ? widget.activeColor
                        : widget.inactiveColor,
                  ),
          ),
        ),
        AnimatedContainer(
          width: isActive || widget.isCurrentScreen ? 30 : 0,
          height: 3,
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: isActive || widget.isCurrentScreen
                ? widget.activeColor
                : widget.inactiveColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
