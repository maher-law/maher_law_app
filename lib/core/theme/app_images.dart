import 'package:flutter/foundation.dart';

abstract class AppImages {
  static const _imagesDebugPath = kDebugMode&&kIsWeb ? 'images' : 'assets/images';

  // static const navLogo = '$_imagesDebugPath/maher_logo.webp';
  // static const logo = '$_imagesDebugPath/logo.webp';
  // static const logo = '$_imagesDebugPath/logo.png';
  // static const lawyer = '$_imagesDebugPath/lawyer.webp';
  // static const team = '$_imagesDebugPath/team.jpg';
  // static const court = '$_imagesDebugPath/court.jpg';
  // static const roman = '$_imagesDebugPath/roman.jpg';
  // static const balance = '$_imagesDebugPath/balance.webp';
  // static const profilePic = '$_imagesDebugPath/profile_pic.jpg';
  static const logo = '$_imagesDebugPath/logo.png';
  static const location = '$_imagesDebugPath/location.png';
  static const lawyer = 'https://ovgkzhlcvbcocfoaksdr.supabase.co/storage/v1/object/public/blogs-thumbnails/assets/lawyer.webp';
  static const team = '$_imagesDebugPath/team.jpg';
  static const court = '$_imagesDebugPath/court.jpg';
  static const roman = '$_imagesDebugPath/roman.jpg';
  static const balance = '$_imagesDebugPath/balance.webp';
  static const profilePic = '$_imagesDebugPath/profile_pic.jpg';
}
