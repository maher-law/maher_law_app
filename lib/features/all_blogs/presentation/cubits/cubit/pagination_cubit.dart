// pagination_cubit.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maher_law_app/core/di/debendency_injection.dart';
import 'package:maher_law_app/core/models/blog_model.dart';

part 'pagination_state.dart';

class PaginationCubit extends Cubit<PaginationState> {
  PaginationCubit() : super(PaginationInitial());

  var collection =
      getIt<FirebaseFirestore>().collection(ApiKeys.blogsCollection);
  // .withConverter<Blog>(
  //   fromFirestore: (snapshot, _) => Blog.fromFirestore(snapshot),
  //   toFirestore: (Blog blog, _) => blog.toFirestore(),
  // );

  int pageSize = 5;
  int currentPage = -1;

  List<QueryDocumentSnapshot<Map<String, dynamic>>> currentPageItems = [];
  // Query<Blog>? lastDoc;

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
      emit(
        PaginationLoaded(
          data: currentPageItems,
          currentPage: currentPage,
        ),
      );
    } catch (e) {
      emit(PaginationError('عذرًا نرجو منك المحاولة في وقت لاحق'));
    }
  }

  Future<void> nextPage() async {
    if (hasNextPage) {
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
      } catch (e) {
        emit(PaginationError(e.toString()));
      }
    }
  }

  Future<void> previousPage() async {
    if (currentPage > 1) {
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
      } catch (e) {
        emit(PaginationError(e.toString()));
      }
    }
  }
}
