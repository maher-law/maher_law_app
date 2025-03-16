import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/di/debendency_injection.dart';
import 'package:maher_law_app/core/models/blog_model.dart';
import 'package:maher_law_app/core/models/message_model.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  final formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var content = TextEditingController();

  Future<void> sendComment(Blog blog) async {
    if (formKey.currentState!.validate()) {
      emit(MessageLoading());
      try {
        var message = Message(
          blog: BlogData(
            title: blog.title,
            link: 'blogs/${blog.id}/${blog.slug}',
          ),
          name: name.text,
          email: email.text,
          message: content.text,
          createdAt: Timestamp.fromDate(DateTime.now()),
        );
        await getIt<FirebaseFirestore>()
            .collection('comments')
            .add(message.toJson());
        name.clear();
        email.clear();
        content.clear();

        emit(MessageSuccess());
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
    return super.close();
  }
}
