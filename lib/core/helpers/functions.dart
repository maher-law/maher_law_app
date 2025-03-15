import 'package:flutter/material.dart';
import 'package:maher_law_app/core/app_constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../theme/app_styles.dart';

void pushWhatsapp(BuildContext context) {
  try {
    launchUrlString('https://wa.me/201050764021');
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'هناك خطأ ما يمكنك محادثتنا عبر رقم الواتس ${AppConstants.whatsappNumber}',
            style: AppStyles.style16bold(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
void pushToCustom(BuildContext context,{required String url}) {
  try {
    launchUrlString(url);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            'هناك خطأ ما يمكنك محادثتنا عبر رقم الواتس ${AppConstants.whatsappNumber}',
            style: AppStyles.style16bold(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
