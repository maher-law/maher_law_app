part of 'message_cubit.dart';

sealed class MessageState {}

final class MessageInitial extends MessageState {}

final class MessageLoading extends MessageState {}
final class MessageSuccess extends MessageState {}


