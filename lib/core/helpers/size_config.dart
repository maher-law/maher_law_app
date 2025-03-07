import 'package:flutter/material.dart';

abstract class SizeConfig {
  static const mobile = 700;
  static const tablet = 1050;
  static bool get isMobile => width <= mobile;
  static bool get isTablet => width > mobile && width <= tablet;
  static bool get isDesktop => width > tablet;

  static late double width, height;

  static void init(BuildContext context) {
    width = MediaQuery.sizeOf(context).width;
    height = MediaQuery.sizeOf(context).height;
  }
}
