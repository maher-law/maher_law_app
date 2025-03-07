import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/theme/app_styles.dart' show AppStyles;
import 'package:maher_law_app/features/services/data/service_blog_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/widget/hover_text_button.dart';
import '../cubit/selected_blog_cubit.dart';

class ServiceBlogWidget extends StatelessWidget {
  const ServiceBlogWidget({super.key, required this.blog});
  final ServiceBlogModel blog;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.4.h),
      child: Row(
        spacing: 1.w,
        children: [
          if (SizeConfig.isDesktop) Icon(blog.icon, color: Colors.white),
          HoverTextButton(
            withBorder: false,
            activeStyle: AppStyles.style16bold(context).copyWith(
              color: Colors.yellow[100],
            ),
            onPressed: () {
              context.read<SelectedBlogCubit>().selectBlog(blog);
            },
            text: blog.title,
            activeColor: Colors.yellow[100]!,
            inactiveColor: Colors.white,
            style: AppStyles.style16medium(context),
          ),
        ],
      ),
    );
  }
}
