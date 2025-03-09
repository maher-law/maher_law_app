import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/widget/hover_button.dart';
import 'package:maher_law_app/features/blog/presentation/cubits/cubit/blog_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BlogContentImage extends StatelessWidget {
  const BlogContentImage({super.key});

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      endScale: 1.01,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: .5,
              blurRadius: 30,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            context.read<BlogCubit>().blog!.thumbnailImageUrl!,
            width: 40.w,
          ),
        ),
      ),
    );
  }
}
