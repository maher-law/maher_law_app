import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sidebarx/sidebarx.dart';

import '../theme/app_colors.dart';
import '../theme/app_styles.dart';
import 'nav_bar/nav_data.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.selectedIndex});
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      showToggleButton: false,
      theme: SidebarXTheme(
        width: 200,
        selectedIconTheme: IconThemeData(color: AppColors.grey),
        textStyle: AppStyles.style16medium(context).copyWith(
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 4.w),
        decoration: BoxDecoration(
          color: AppColors.grey,
        ),
        selectedTextStyle: AppStyles.style16bold(context).copyWith(
          color: AppColors.green,
        ),
      ),
      controller:
          SidebarXController(selectedIndex: selectedIndex, extended: true),
      items: List.generate(
        navData.length,
        (index) => SidebarXItem(
          onTap: () {
            // bool isCurrentScreen = GoRouter.of(context)
            //         .routeInformationProvider
            //         .value
            //         .uri
            //         .toString() ==
            //     navData[index].route;
            // if (!isCurrentScreen) {
            context.go(navData[index].route);
            // }
          },
          iconBuilder: (selected, hovered) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Icon(
                navData[index].icon,
                color: selected ? AppColors.green : Colors.white,
              ),
            );
          },
          icon: navData[index].icon,
          label: navData[index].title,
        ),
      ),
    );
  }
}
