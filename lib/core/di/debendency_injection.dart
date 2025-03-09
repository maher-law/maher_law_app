import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import '../services/firebase_services.dart';


final getIt = GetIt.instance;

void setupGetIt() {
  // getIt.registerLazySingleton<FirebaseServices>(() => FirebaseServices());
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
