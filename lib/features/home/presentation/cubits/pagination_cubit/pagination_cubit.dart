// pagination_cubit.dart

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/di/debendency_injection.dart';

import '../../../../../core/api_keys.dart';

part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit(this.isBlogs) : super(PaginationInitial());
  final bool isBlogs;
  var searchController = TextEditingController();
  var collection =
      getIt<FirebaseFirestore>().collection(ApiKeys.blogsCollection);

  List<QueryDocumentSnapshot<Map<String, dynamic>>> currentPageItems = [];

  bool hasNextPage = true;

  Future<void> loadData() async {
    emit(PaginationLoading());
    try {
      final snapshot =
          await collection.orderBy(ApiKeys.createdAt, descending: true).get();

      currentPageItems = snapshot.docs;

      currentPageItems.removeWhere((blog) => blog.data()['is_blog'] == isBlogs);

      emit(PaginationLoaded(data: currentPageItems));
    } catch (e) {
      log('==================================');
      log(e.toString());
      emit(
        PaginationError(
          'عذرًا نرجو منك التأكد من الاتصال بالانترنت والمحاولة مرة أخرى',
        ),
      );
    }
  }
  // Future<void> loadFirstPage() async {
  //   emit(PaginationLoading());
  //   try {
  //     final snapshot = await collection
  //         .orderBy(ApiKeys.createdAt, descending: true)
  //         .where('is_blog', isEqualTo: true)
  //         .limit(pageSize)
  //         .get();

  //     currentPageItems = snapshot.docs;
  //     hasNextPage = snapshot.docs.length == pageSize;

  //     currentPage = 1;
  //     emit(PaginationLoaded(data: currentPageItems, currentPage: currentPage));
  //   } catch (e) {
  //     emit(PaginationError('عذرًا نرجو منك المحاولة في وقت لاحق'));
  //   }
  // }

  // Future<void> getBySearch() async {
  //   emit(PaginationLoading());

  //   try {
  //     final snapshot = await getIt<FirebaseFirestore>()
  //         .collection(ApiKeys.blogsCollection)
  //         .where(ApiKeys.title, isGreaterThanOrEqualTo: searchController.text)
  //         .where(ApiKeys.title, isLessThan: '${searchController.text}\uf8ff')
  //         .where('is_blog', isEqualTo: true)
  //         .get();

  //     currentPageItems = snapshot.docs;
  //     currentPage = -1;

  //     emit(PaginationLoaded(data: currentPageItems, currentPage: -1));
  //   } catch (e) {
  //     emit(PaginationError('عذرًا نرجو منك المحاولة في وقت لاحق'));
  //   }
  // }

  // Future<bool> nextPage() async {
  //   if (currentPage == -1) {
  //     loadFirstPage();
  //     return true;
  //   } else if (hasNextPage) {
  //     try {
  //       emit(PaginationLoading());

  //       final lastDoc = currentPageItems.last;
  //       final snapshot = await collection
  //           .orderBy(ApiKeys.createdAt, descending: true)
  //           .where('is_blog', isEqualTo: true)
  //           .startAfterDocument(lastDoc)
  //           .limit(pageSize)
  //           .get();

  //       currentPageItems = snapshot.docs;

  //       hasNextPage = currentPageItems.length == pageSize;

  //       currentPage++;

  //       emit(
  //         PaginationLoaded(
  //           data: currentPageItems,
  //           currentPage: currentPage,
  //         ),
  //       );
  //       return true;
  //     } catch (e) {
  //       emit(PaginationError('عذرًا نرجو منك المحاولة في وقت لاحق'));
  //       return true;
  //     }
  //   } else {
  //     return false;
  //   }
  // }

  // Future<bool> previousPage() async {
  //   if (currentPage == -1) {
  //     loadFirstPage();
  //     return true;
  //   } else if (currentPage > 1) {
  //     try {
  //       emit(PaginationLoading());

  //       final firstDoc = currentPageItems.first;
  //       final snapshot = await collection
  //           .orderBy(ApiKeys.createdAt, descending: true)
  //           .endBeforeDocument(firstDoc)
  //           .limitToLast(pageSize)
  //           .get();

  //       currentPageItems = snapshot.docs;

  //       hasNextPage = currentPageItems.length == pageSize;

  //       currentPage--;

  //       emit(
  //         PaginationLoaded(data: currentPageItems, currentPage: currentPage),
  //       );
  //       return true;
  //     } catch (e) {
  //       emit(PaginationError('عذرًا نرجو منك المحاولة في وقت لاحق'));
  //       return true;
  //     }
  //   } else {
  //     return false;
  //   }
  // }
}
