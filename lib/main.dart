import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:maher_law_app/core/helpers/app_router.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/theme/app_themes.dart';
import 'package:maher_law_app/firebase_options.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/di/debendency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  setupGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaherApp());
  // runApp(
  //   DevicePreview(
  //     enabled: false,
  //     builder: (context) => const MaherApp(),
  //   ),
  // );
}

class MaherApp extends StatelessWidget {
  const MaherApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ResponsiveSizer(
      maxMobileWidth: SizeConfig.mobile.toDouble(),
      maxTabletWidth: SizeConfig.tablet.toDouble(),
      builder: (p0, p1, p2) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          supportedLocales: const [Locale('ar'), Locale('en')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            FlutterQuillLocalizations.delegate,
          ],
          title: 'الوسيط القانوني',
          theme: AppThemes.lightTheme,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
