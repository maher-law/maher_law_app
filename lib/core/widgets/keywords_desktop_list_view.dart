import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:maher_law_app/core/theme/app_icons.dart';
import 'package:maher_law_app/features/all_blogs/presentation/cubits/keywords_cubit/keywords_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'keyword_desktop_widget.dart';

class KeywordsDesktopListView extends StatelessWidget {
  const KeywordsDesktopListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KeywordsCubit, KeywordsState>(
      builder: (context, state) {
        switch (state) {
          case KeywordsSuccess():
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              itemCount: state.keywords.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KeyworkDesktopWidget(
                      keyword: state.keywords[index],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 1.h),
            );

          case KeywordsFailure():
            return Center(child: Lottie.asset(AppIcons.empty));

          default:
            return Center(child: Lottie.asset(AppIcons.loading));
        }
      },
    );
  }
}
