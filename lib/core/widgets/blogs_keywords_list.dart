import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/theme/app_styles.dart';
import 'package:maher_law_app/features/all_blogs/presentation/cubits/keywords_cubit/keywords_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_colors.dart';
import 'keywords_desktop_list_view.dart';
import 'keywords_tablet_grid_view.dart';

class BlogsKeywordsList extends StatelessWidget {
  const BlogsKeywordsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KeywordsCubit()..loadKeywords(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              spreadRadius: .5,
              blurRadius: 30,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.only(top: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'وسوم',
              style: SizeConfig.isDesktop
                  ? AppStyles.style18bold(context)
                  : AppStyles.style26bold(context).copyWith(
                      color: Colors.black,
                    ),
            ),
            SizedBox(height: 2.h),
            if (SizeConfig.isDesktop) const KeywordsDesktopListView(),
            if (!SizeConfig.isDesktop) const KeywordsTabletGridView(),
          ],
        ),
      ),
    );
  }
}
