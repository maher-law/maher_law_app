import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../features/all_blogs/presentation/cubits/keywords_cubit/keywords_cubit.dart';
import '../theme/app_icons.dart';
import 'keyword_tablet_widget.dart';

class KeywordsTabletGridView extends StatelessWidget {
  const KeywordsTabletGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KeywordsCubit, KeywordsState>(
      builder: (context, state) {
        switch (state) {
          case KeywordsSuccess():
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 5.h,
                mainAxisSpacing: 1.h,
                crossAxisSpacing: 2.w,
              ),
              itemCount: state.keywords.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return KeyworkTabletWidget(keyword: state.keywords[index]);
              },
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
