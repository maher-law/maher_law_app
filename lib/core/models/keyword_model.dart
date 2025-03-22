// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../api_keys.dart';

class Keyword extends Equatable {
  final String link, title;

  const Keyword({required this.link, required this.title});

  factory Keyword.fromJson(Map data) {
    return Keyword(link: data[ApiKeys.link], title: data[ApiKeys.title]);
  }

  @override
  List<Object?> get props => [link, title];
}
