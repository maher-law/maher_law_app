part of 'blog_cubit.dart';

sealed class BlogState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogSuccess extends BlogState {}

final class BlogFailure extends BlogState {}
