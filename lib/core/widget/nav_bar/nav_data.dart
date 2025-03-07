import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/app_router.dart';

class NavData {
  final String title;
  final String route;
  final IconData icon;

  NavData({required this.title, required this.route, required this.icon});
}

List<NavData> navData = [
  NavData(title: 'الرئيسية', route: AppRouter.home, icon: CupertinoIcons.home),
  NavData(
    title: 'المجالات القانونية',
    route: AppRouter.services,
    icon: Icons.newspaper,
  ),
  NavData(title: 'من نحن', route: AppRouter.about, icon: CupertinoIcons.info),
  NavData(title: 'المقالات', route: AppRouter.blogs, icon: Icons.web),
  NavData(
    title: 'تواصل معنا',
    route: AppRouter.contact,
    icon: CupertinoIcons.phone,
  ),
];
