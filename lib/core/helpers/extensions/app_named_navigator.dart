import 'package:flutter/widgets.dart';

extension AppNamedNavigator on BuildContext {
  void pop() => Navigator.pop(this);

  void canPop() => Navigator.canPop(this);

  void pushNamed(String route) {
    Navigator.pushNamed(this, route);
  }

  void pushReplacementNamed(String route) {
    Navigator.pushReplacementNamed(
      this,
      route,
    );
  }

  void pushNamedAndRemoveUntil(String route) {
    Navigator.pushNamedAndRemoveUntil(
      this,
      route,
      (route) => false,
    );
  }
}
