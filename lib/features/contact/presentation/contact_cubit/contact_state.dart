part of 'contact_cubit.dart';

sealed class ContactUsState {}

final class ContactInitial extends ContactUsState {}

final class ContactLoading extends ContactUsState {}

final class ContactSuccess extends ContactUsState {}
