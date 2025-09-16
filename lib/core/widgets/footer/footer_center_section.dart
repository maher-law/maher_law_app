import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../features/home/presentation/cubit/data_cubit.dart';
import '../../helpers/size_config.dart';
import '../../theme/app_styles.dart';

class FooterCenterSection extends StatelessWidget {
  const FooterCenterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: SizeConfig.isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'ساعات العمل',
          style: AppStyles.style22bold(context).copyWith(color: Colors.black),
        ),
        SizedBox(height: 3.h),
        Text(
          'متاح 24 ساعة للخدمات والاستشارات القانونية عبر الواتس ${context.read<DataCubit>().phone.replaceFirst(RegExp(r'2'), '')}',
          textAlign: SizeConfig.isMobile ? TextAlign.center : null,
          style: AppStyles.style16medium(context).copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
