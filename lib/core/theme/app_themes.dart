import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppThemes {
  static final lightTheme = ThemeData(
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.green),
    ),
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Cairo',
  );
  // static ThemeData lightTheme(BuildContext context) => ThemeData(
  //       fontFamily: 'Cairo',
  //       useMaterial3: true,
  //       scaffoldBackgroundColor: AppColors.white,
  //       colorScheme: ColorScheme.light(
  //         primary: AppColors.green,
  //         secondary: AppColors.orange,
  //         surface: AppColors.cyan,
  //         outline: AppColors.grey,
  //         scrim: AppColors.darkGreen,
  //       ),
  //       scrollbarTheme: ScrollbarThemeData(
  //         thumbColor: WidgetStateProperty.all(AppColors.green),
  //       ),
  //       textTheme: TextTheme(
  //         bodyLarge: AppStyles.style14medium(context),
  //         bodyMedium: AppStyles.style16medium(context),
  //         displayLarge: AppStyles.style16bold(context),
  //         displayMedium: AppStyles.style18medium(context),
  //         displaySmall: AppStyles.style18bold(context),
  //         headlineMedium: AppStyles.style22bold(context),
  //         headlineSmall: AppStyles.style22medium(context),
  //         titleLarge: AppStyles.style24bold(context),
  //         titleMedium: AppStyles.style30medium(context),
  //         titleSmall: AppStyles.style22black(context),
  //         bodySmall: AppStyles.style26bold(context),
  //         labelSmall: AppStyles.style40bold(context),
  //         labelLarge: AppStyles.style46bold(context),
  //         headlineLarge: AppStyles.style55bold(context),
  //       ),
  //     );

  // static ThemeData darkTheme(BuildContext context) => ThemeData(
  //       fontFamily: 'Cairo',
  //       useMaterial3: true,
  //       scaffoldBackgroundColor: AppColors.darkWhite,
  //       colorScheme: ColorScheme.light(
  //                 brightness: Brightness.dark,

  //         primary: AppColors.green,
  //         secondary: AppColors.orange,
  //         surface: AppColors.darkCyan,
  //         outline: AppColors.darkGrey,
  //         scrim: AppColors.darkDarkGreen,
  //       ),
  //       scrollbarTheme: ScrollbarThemeData(
  //         thumbColor: WidgetStateProperty.all(AppColors.green),
  //       ),
  //       textTheme: TextTheme(
  //         bodyLarge: AppStyles.style14medium(context),
  //         bodyMedium: AppStyles.style16medium(context),
  //         displayLarge: AppStyles.style16bold(context),
  //         displayMedium: AppStyles.style18medium(context),
  //         displaySmall: AppStyles.style18bold(context),
  //         headlineMedium: AppStyles.style22bold(context),
  //         headlineSmall: AppStyles.style22medium(context),
  //         titleLarge: AppStyles.style24bold(context),
  //         titleMedium: AppStyles.style30medium(context),
  //         titleSmall: AppStyles.style22black(context),
  //         bodySmall: AppStyles.style26bold(context),
  //         labelSmall: AppStyles.style40bold(context),
  //         labelLarge: AppStyles.style46bold(context),
  //         headlineLarge: AppStyles.style55bold(context),
  //       ),
  //     );
}
