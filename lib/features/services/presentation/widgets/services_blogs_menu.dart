import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../data/service_blog_model.dart';
import '../cubit/selected_blog_cubit.dart';

class ServicesBlogsMenu extends StatelessWidget {
  const ServicesBlogsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<ServiceBlogModel>(
      onSelected: (value) {
        if (value != null) {
          context.read<SelectedBlogCubit>().selectBlog(value);
        }
      },
      initialSelection: blogs[0],
      textStyle: AppStyles.style16bold(context),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.green),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      enableSearch: false,
      dropdownMenuEntries: List.generate(
        6,
        (index) => DropdownMenuEntry(
          value: blogs[index],
          label: blogs[index].title,
          labelWidget: Text(
            blogs[index].title,
            style: AppStyles.style16medium(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
