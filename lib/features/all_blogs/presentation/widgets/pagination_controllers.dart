import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/features/all_blogs/presentation/cubits/cubit/pagination_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../blog/presentation/widgets/blog_tag_widget.dart';

class PaginationControllers extends StatelessWidget {
  const PaginationControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 2.w),
        CustomTextButton(
          onTap: () {
            context.read<PaginationCubit>().previousPage();
          },
          text: 'السابق',
        ),
        SizedBox(width: .5.w),
        CustomTextButton(
          onTap: () {
            context.read<PaginationCubit>().nextPage();
          },
          text: 'التالي',
        ),
      ],
    );
  }
}
