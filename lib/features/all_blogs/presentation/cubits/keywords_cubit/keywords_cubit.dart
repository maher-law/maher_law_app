import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/debendency_injection.dart';
import '../../../../../core/models/blog_model.dart';
import '../../../../../core/models/keyword_model.dart';

part 'keywords_state.dart';

class KeywordsCubit extends Cubit<KeywordsState> {
  KeywordsCubit() : super(KeywordsInitial());
  List<Keyword> keywords = [];

  Future<void> loadKeywords() async {
    emit(KeywordsInitial());

    try {
      final snapshot = await getIt<FirebaseFirestore>()
          .collection(ApiKeys.keywords)
          .orderBy(ApiKeys.createdAt, descending: true)
          .limit(10)
          .get();

      keywords =
          snapshot.docs.map((doc) => Keyword.fromJson(doc.data())).toList();

      log(snapshot.docs[0].data().toString());
      emit(KeywordsSuccess(keywords: keywords));
    } catch (e) {

      emit(KeywordsFailure(errMessage: 'عذرًا نرجو منك المحاولة في وقت لاحق'));
    }
  }
}
