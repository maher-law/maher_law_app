import 'package:flutter/material.dart';
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
            'هناك خطأ ما يمكنك محادثتنا عبر رقم الواتس 01050764021',
            style: AppStyles.style16bold(context).copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
