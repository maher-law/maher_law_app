import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:maher_law_app/features/blog/presentation/cubits/blog_cubit/blog_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../services/presentation/widgets/decorated_button.dart';
import 'blog_tag_widget.dart';

class BlogTags extends StatelessWidget {
  const BlogTags({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        DecoratedButton(
          onTap: () {
            var baseUrl = 'https://maher8.web.app';
            var fullRoute = GoRouter.of(context).state.uri.toString();
            Clipboard.setData(ClipboardData(text: '$baseUrl$fullRoute'));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: AppColors.green,
                content: Center(
                  child: Text(
                    'تم نسخ رابط المقالة',
                    style: AppStyles.style16bold(context),
                  ),
                ),
              ),
            );
          },
          radius: 0,
          padding: EdgeInsets.symmetric(horizontal: .5.w, vertical: 4),
          child: const Icon(CupertinoIcons.share, color: Colors.white),
        ),
        DecoratedButton(
          radius: 0,
          padding: EdgeInsets.symmetric(horizontal: .5.w, vertical: 4),
          child: const Icon(Icons.tag, color: Colors.white),
        ),
        ...List.generate(
          context.read<BlogCubit>().blog!.tags?.length ?? 0,
          (index) => CustomTextButton(
            onTap: () {},
            text: context.read<BlogCubit>().blog!.tags![index],
          ),
        ),
      ],
    );
  }
}
