import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/widgets/hover_button.dart';
import 'package:maher_law_app/features/blog/presentation/cubits/blog_cubit/blog_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';

class BlogContentImage extends StatelessWidget {
  const BlogContentImage({super.key});

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      endScale: 1.01,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              spreadRadius: .5,
              blurRadius: 30,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: ImageRenderer(
            alt: 'صورة المقالة',
            src: context.read<BlogCubit>().blog!.thumbnailImageUrl,
            child: Image.network(
              context.read<BlogCubit>().blog!.thumbnailImageUrl,
              width: SizeConfig.isDesktop ? 40.w : 85.w,
              errorBuilder: (_, __, ___) => const Center(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
