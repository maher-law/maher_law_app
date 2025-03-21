import 'package:flutter/foundation.dart';

abstract class AppIcons {
  
  static const _iconsPath = kDebugMode&&kIsWeb ? 'svgs' : 'assets/svgs';
  static const _lottiesPath = kDebugMode&&kIsWeb ? 'lotties' : 'assets/lotties';

  static const hammer = '$_iconsPath/hammer.svg';
  static const shield = '$_iconsPath/shield.svg';
  static const handshake = '$_iconsPath/handshake.svg';
  static const balance = '$_iconsPath/balance.svg';
  static const court = '$_iconsPath/court.svg';
  static const stars = '$_iconsPath/stars.svg';
  static const handcuffs = '$_iconsPath/handcuffs.svg';
  static const certificate = '$_iconsPath/certificate.svg';
  static const lawBook = '$_iconsPath/law_book.svg';
  static const email = '$_iconsPath/email.svg';

  static const locate = '$_iconsPath/locate.svg';
  static const menu = '$_iconsPath/menu.svg';
  static const phone = '$_iconsPath/phone.svg';
  static const whatsapp = '$_iconsPath/whatsapp.svg';
  static const whatsappLight = '$_iconsPath/whatsapp_light.svg';

  static const error404 = '$_lottiesPath/404.json';
  static const empty = '$_lottiesPath/empty.json';
  static const loading = '$_lottiesPath/loading.json';
}
