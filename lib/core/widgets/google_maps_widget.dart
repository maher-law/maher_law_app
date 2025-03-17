import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:maher_law_app/core/theme/app_images.dart';

import '../app_constants.dart';
import '../helpers/functions.dart';
import '../theme/app_colors.dart';

class GoogleMapWidget extends StatelessWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.green, width: 4),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            spreadRadius: 5,
            blurRadius: 20,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: kIsWeb
            ? InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(AppConstants.location),
                ),
              )
            : GestureDetector(
                onTap: () {
                  pushToCustom(
                    context,
                    url: 'https://maps.app.goo.gl/Zp12u9UkeqMxsoV59',
                  );
                },
                child: Image.asset(AppImages.location, fit: BoxFit.cover),
              ),
      ),
    );
  }
}
