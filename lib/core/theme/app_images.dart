import 'package:flutter/foundation.dart';

abstract class AppImages {
  static const _imagesDebugPath = kDebugMode&&kIsWeb ? 'images' : 'assets/images';

  static const logo = '$_imagesDebugPath/logo.png';
  static const lawyer = '$_imagesDebugPath/lawyer.webp';
 }
