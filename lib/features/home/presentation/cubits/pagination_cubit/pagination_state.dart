part of 'pagination_cubit.dart';

sealed class PaginationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PaginationInitial extends PaginationState {}

class PaginationLoading extends PaginationState {}

class PaginationLoaded extends PaginationState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;

  PaginationLoaded({required this.data});
  @override
  List<Object?> get props => [data];
}

class PaginationError extends PaginationState {
  final String message;

  PaginationError(this.message);
  @override
  List<Object?> get props => [message];
}
