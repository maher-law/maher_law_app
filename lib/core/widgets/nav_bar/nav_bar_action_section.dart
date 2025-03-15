import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:maher_law_app/core/widgets/hover_text_button.dart';
import 'package:maher_law_app/core/widgets/nav_bar/nav_data.dart';

class NavBarActionsSection extends StatelessWidget {
  const NavBarActionsSection({super.key, this.padding});
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(navData.length, (index) {
        bool isCurrentScreen = GoRouter.of(
              context,
            ).routeInformationProvider.value.uri.toString() ==
            navData[index].route;
        return Container(
          alignment: Alignment.center,
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: HoverTextButton(
            isCurrentScreen: isCurrentScreen,
            onPressed: () {
              if (!isCurrentScreen) {
                context.go(navData[index].route);
              }
            },
            text: navData[index].title,
            activeColor: AppColors.orange,
            inactiveColor: AppColors.green,
            style: AppStyles.style16bold(context),
          ),
        );
      }),
    );
  }
}
