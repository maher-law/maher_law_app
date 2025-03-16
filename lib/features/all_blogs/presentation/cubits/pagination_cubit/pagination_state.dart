part of 'pagination_cubit.dart';

sealed class PaginationState {}

class PaginationInitial extends PaginationState {}

class PaginationLoading extends PaginationState {}

class PaginationLoaded extends PaginationState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;
  final int currentPage;

  PaginationLoaded({
    required this.data,
    required this.currentPage,
  });
}

class PaginationError extends PaginationState {
  final String message;

  PaginationError(this.message);
}
