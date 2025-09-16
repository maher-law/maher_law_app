import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../features/home/presentation/cubit/data_cubit.dart';
import '../../helpers/size_config.dart';
import '../../theme/app_styles.dart';

class FooterLeftSection extends StatelessWidget {
  const FooterLeftSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: SizeConfig.isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          'اتصال',
          style: AppStyles.style22bold(context).copyWith(color: Colors.black),
        ),
        SizedBox(height: 3.h),
        Text(
          'الهاتف: ${context.read<DataCubit>().phone}',
          textAlign: SizeConfig.isMobile ? TextAlign.center : null,
          style: AppStyles.style16medium(context).copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          'الايميل: ${context.read<DataCubit>().email}',
          textAlign: SizeConfig.isMobile ? TextAlign.center : null,
          style: AppStyles.style16medium(context).copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
