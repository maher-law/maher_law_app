// pagination_cubit.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/di/debendency_injection.dart';
import 'package:maher_law_app/core/models/blog_model.dart';

part 'pagination_state.dart';



class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(PaginationInitial());
  var searchController = TextEditingController();
  var collection =
      getIt<FirebaseFirestore>().collection(ApiKeys.blogsCollection);

  int pageSize = 5;
  int currentPage = -1;

  List<QueryDocumentSnapshot<Map<String, dynamic>>> currentPageItems = [];

  bool hasNextPage = true;

  

  Future<void> loadFirstPage() async {
    emit(PaginationLoading());
    try {
      final snapshot = await collection
          .orderBy(ApiKeys.createdAt, descending: true)
          .limit(pageSize)
          .get();

      currentPageItems = snapshot.docs;
      hasNextPage = snapshot.docs.length == pageSize;

      currentPage = 1;
      emit(PaginationLoaded(data: currentPageItems, currentPage: currentPage));
    } catch (e) {
      emit(PaginationError('عذرًا نرجو منك المحاولة في وقت لاحق'));
    }
  }

  Future<void> getBySearch() async {
    emit(PaginationLoading());

    try {
      final snapshot = await getIt<FirebaseFirestore>()
          .collection(ApiKeys.blogsCollection)
          .where(ApiKeys.title, isGreaterThanOrEqualTo: searchController.text)
          .where(ApiKeys.title, isLessThan: '${searchController.text}\uf8ff')
          .get();

      currentPageItems = snapshot.docs;
      currentPage = -1;

      emit(PaginationLoaded(data: currentPageItems, currentPage: -1));
    } catch (e) {
      emit(PaginationError('عذرًا نرجو منك المحاولة في وقت لاحق'));
    }
  }

  Future<bool> nextPage() async {
    if (currentPage == -1) {
      loadFirstPage();
      return true;
    } else if (hasNextPage) {
      try {
        emit(PaginationLoading());

        final lastDoc = currentPageItems.last;
        final snapshot = await collection
            .orderBy(ApiKeys.createdAt, descending: true)
            .startAfterDocument(lastDoc)
            .limit(pageSize)
            .get();

        currentPageItems = snapshot.docs;

        hasNextPage = currentPageItems.length == pageSize;

        currentPage++;

        emit(
          PaginationLoaded(
            data: currentPageItems,
            currentPage: currentPage,
          ),
        );
        return true;
      } catch (e) {
        emit(PaginationError('عذرًا نرجو منك المحاولة في وقت لاحق'));
        return true;
      }
    } else {
      return false;
    }
  }

  Future<bool> previousPage() async {
    if (currentPage == -1) {
      loadFirstPage();
      return true;
    } else if (currentPage > 1) {
      try {
        emit(PaginationLoading());

        final firstDoc = currentPageItems.first;
        final snapshot = await collection
            .orderBy(ApiKeys.createdAt, descending: true)
            .endBeforeDocument(firstDoc)
            .limitToLast(pageSize)
            .get();

        currentPageItems = snapshot.docs;

        hasNextPage = currentPageItems.length == pageSize;

        currentPage--;

        emit(
          PaginationLoaded(data: currentPageItems, currentPage: currentPage),
        );
        return true;
      } catch (e) {
        emit(PaginationError('عذرًا نرجو منك المحاولة في وقت لاحق'));
        return true;
      }
    } else {
      return false;
    }
  }
}
