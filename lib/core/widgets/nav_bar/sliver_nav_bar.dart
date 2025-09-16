import 'package:flutter/material.dart';
import 'package:maher_law_app/core/helpers/extensions/screen_details.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:maher_law_app/core/theme/app_icons.dart';
import 'package:maher_law_app/core/widgets/custom_icon_button.dart';
import 'package:maher_law_app/core/widgets/nav_bar/nav_bar_action_section.dart';
import 'package:maher_law_app/features/home/presentation/cubit/data_cubit.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/app_images.dart';
import 'nav_contact_button.dart';
import 'sliver_app_bar_delegate.dart';

class SliverNavBar extends StatelessWidget {
  const SliverNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DataCubit>().getData();
    if (context.screenWidth < SizeConfig.mobile) {
      return const SliverMobileNavBar();
    } else if (context.screenWidth < SizeConfig.tablet) {
      return const SliverTabletNavBar();
    } else {
      return const SliverMobileNavBar();
    }
  }
}

class SliverDesktopNavBar extends StatelessWidget {
  const SliverDesktopNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: SliverAppBarDelegate(
        minHeight: 90,
        maxHeight: 105,
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 14, right: 60, left: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: .6),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo, fit: BoxFit.contain, width: 22.w),
              const Expanded(child: NavBarActionsSection()),
              const NavContactButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverTabletNavBar extends StatelessWidget {
  const SliverTabletNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: SliverAppBarDelegate(
        minHeight: 90,
        maxHeight: 105,
        child: Container(
          padding:
              const EdgeInsets.only(top: 20, bottom: 14, right: 30, left: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: .6),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo, fit: BoxFit.cover, width: 20.w),
              const Expanded(
                child: NavBarActionsSection(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                ),
              ),
              // NavContactButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverMobileNavBar extends StatelessWidget {
  const SliverMobileNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: SliverAppBarDelegate(
        minHeight: 75 + MediaQuery.of(context).padding.top,
        maxHeight: 90 + MediaQuery.of(context).padding.top,
        child: Container(
          padding: EdgeInsets.only(
            top: 20 + MediaQuery.of(context).padding.top,
            bottom: 14,
            right: 50,
            left: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade400, width: .6),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                fit: BoxFit.cover,
                // width: 200,
              ),
              CustomIconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                color: AppColors.orange,
                icon: AppIcons.menu,
                width: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
