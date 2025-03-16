import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/di/debendency_injection.dart';
import 'package:maher_law_app/core/models/message_model.dart';

part 'contact_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactInitial());

  final formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var subject = TextEditingController();
  var content = TextEditingController();

  Future<void> sendMessage() async {
    if (formKey.currentState!.validate()) {
      emit(ContactLoading());
      try {
        var message = Message(
          name: name.text,
          email: email.text,
          message: content.text,
          subject: (subject.text.replaceAll(' ', '')).isNotEmpty
              ? subject.text
              : null,
          createdAt: Timestamp.fromDate(DateTime.now()),
        );

        await getIt<FirebaseFirestore>().collection('contact-us').add(
              message.toJson(),
            );

        name.clear();
        email.clear();
        content.clear();
        subject.clear();

        emit(ContactSuccess());
      } catch (e) {
        log(e.toString());
      }
    }
  }

  @override
  Future<void> close() {
    name.dispose();
    email.dispose();
    content.dispose();
    subject.dispose();

    return super.close();
  }
}
