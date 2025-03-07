import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'mini_blog_details.dart';
import 'mini_blog_image.dart';

class MiniBlogWidget extends StatelessWidget {
  const MiniBlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: MiniBlogImage()),
        SizedBox(width: 3.w),
        Expanded(flex: 3, child: MiniBlogDetails()),
      ],
    );
  }
}
