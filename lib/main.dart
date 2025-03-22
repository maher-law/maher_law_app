import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/bloc_observer.dart';
import 'package:maher_law_app/firebase_options.dart';

import 'app.dart';
import 'core/di/debendency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();

  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MaherApp());
}
