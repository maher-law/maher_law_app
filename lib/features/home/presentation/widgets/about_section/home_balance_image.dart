import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/theme/app_images.dart';

class HomeBalanceImage extends StatelessWidget {
  const HomeBalanceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: 25.w,
            height: 70.h,
            child: Image.asset(
              AppImages.balance,
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
