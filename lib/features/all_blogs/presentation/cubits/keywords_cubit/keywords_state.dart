part of 'keywords_cubit.dart';

sealed class KeywordsState {}

final class KeywordsInitial extends KeywordsState {}

final class KeywordsLoading extends KeywordsState {}

final class KeywordsSuccess extends KeywordsState {
  final List<Keyword> keywords;

  KeywordsSuccess({required this.keywords});
}

final class KeywordsFailure extends KeywordsState {
  final String errMessage;

  KeywordsFailure({required this.errMessage});
}
