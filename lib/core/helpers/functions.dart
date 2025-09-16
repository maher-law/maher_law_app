import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/features/home/presentation/cubit/data_cubit.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../theme/app_styles.dart';

void pushWhatsapp(BuildContext context) {
  try {
    launchUrlString('https://wa.me/${context.read<DataCubit>().phone}');
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'هناك خطأ ما يمكنك محادثتنا عبر رقم الواتس ${context.read<DataCubit>().phone}',
            style: AppStyles.style16bold(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

void pushToCustom(BuildContext context, {required String url}) {
  launchUrlString(url);
}
