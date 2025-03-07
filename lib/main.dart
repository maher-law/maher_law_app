import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:maher_law_app/core/helpers/app_router.dart';
import 'package:maher_law_app/core/helpers/size_config.dart';
import 'package:maher_law_app/core/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
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
          ],
          title: 'Maher',
          theme: ThemeData(
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: WidgetStateProperty.all(AppColors.green),
            ),
            useMaterial3: true,
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: 'Cairo',
          ),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
