import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:maher_law_app/bloc_observer.dart';
import 'package:maher_law_app/firebase_options.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'core/api_keys.dart';
import 'core/di/debendency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUrlStrategy(PathUrlStrategy());

  setupGetIt();
  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn = ApiKeys.dsn;
        options.tracesSampleRate = 1;
      },
      appRunner: () => const MaherApp(),
    );
  } else {
    runApp(DevicePreview(builder: (context) => const MaherApp()));
  }
}
