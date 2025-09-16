part of 'data_cubit.dart';

sealed class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

final class DataInitial extends DataState {}
