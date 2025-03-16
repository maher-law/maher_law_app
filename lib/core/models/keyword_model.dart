import 'package:maher_law_app/core/models/blog_model.dart';

class Keyword {
  final String link, title;

  Keyword({required this.link, required this.title});

  factory Keyword.fromJson(Map data) {
    return Keyword(link: data[ApiKeys.link], title: data[ApiKeys.title]);
  }
}
