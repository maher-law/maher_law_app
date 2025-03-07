import 'package:flutter/material.dart';
import 'package:maher_law_app/core/widget/hover_text_button.dart';

class CustomAnimatedText extends StatelessWidget {
  const CustomAnimatedText({
    super.key,
    required this.widget,
    required this.isActive,
  });

  final HoverTextButton widget;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      
      firstChild: Text(
        widget.text,
        style: widget.activeStyle ??
            widget.style.copyWith(color: widget.activeColor),
      ),
      secondChild: Text(
        widget.text,
        style: widget.style.copyWith(color: widget.inactiveColor),
      ),
      crossFadeState: isActive
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
    );
  }
}
