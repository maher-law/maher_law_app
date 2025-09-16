import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/di/debendency_injection.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  String? email = 'mr.maher_lawyer@yahoo.com';
  String? phone = '201050764021';
  // String email = 'taha@gmail.com';
  // String phone = '201033527637';

  void getData() async {
    try {
      final snapshot = await getIt<FirebaseFirestore>()
          .collection('settings')
          .doc('contact')
          .get();

      email = snapshot.data()?['email'];
      phone = snapshot.data()?['phone'];
      emit(state);
    } catch (e) {
      log(e.toString());
    }
  }
}
