import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../features/all_blogs/presentation/cubits/cubit/pagination_cubit.dart';
import '../theme/app_colors.dart';
import 'hover_button.dart';

class BlogsSearchBar extends StatelessWidget {
  const BlogsSearchBar(
      {super.key,
      this.decorated = true,
      this.padding,
      this.controller,
      this.onTap});
  final bool decorated;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      endScale: 1.01,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
        decoration: decorated
            ? BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
                // border: Border.all(color: AppColors.grey, width: 2.5),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                    spreadRadius: .5,
                    blurRadius: 30,
                    offset: Offset(0, 2),
                  ),
                ],
              )
            : null,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (_) {
                  if (onTap != null) {
                    onTap!.call();
                  } else {
                    context.read<PaginationCubit>().getBySearch();
                  }
                },
                controller: controller ??
                    context.read<PaginationCubit>().searchController,
                decoration: InputDecoration(
                  hintText: 'ابحث',
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.green, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.green, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.green, width: 2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 4),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap:
                  onTap ?? () => context.read<PaginationCubit>().getBySearch(),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(12),
                child: const HoverButton(
                  endScale: 1.15,
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
