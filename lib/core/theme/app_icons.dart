import 'package:flutter/foundation.dart';

abstract class AppIcons {
  
  static const _iconsPath = kDebugMode&&kIsWeb ? 'svgs' : 'assets/svgs';
  static const _lottiesPath = kDebugMode&&kIsWeb ? 'lotties' : 'assets/lotties';

  static const hammer = '$_iconsPath/hammer.svg';
  static const shield = '$_iconsPath/shield.svg';
  static const handshake = '$_iconsPath/handshake.svg';
  static const balance = '$_iconsPath/balance.svg';

  static const email = '$_iconsPath/email.svg';
  static const whatsapp = '$_iconsPath/whatsapp.svg';

  static const empty = '$_lottiesPath/empty.json';
  static const loading = '$_lottiesPath/loading.json';
}
