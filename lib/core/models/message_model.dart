// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../api_keys.dart';

class BlogData {
  final String title;
  final String link;

  BlogData({required this.title, required this.link});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'link': link,
    };
  }
}

class Message extends Equatable {
  final String name, email, message;
  final String? subject;
  final BlogData? blog;
  final Timestamp createdAt;

  const Message({
    required this.name,
    required this.email,
    required this.message,
    this.subject,
    this.blog,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.name: name,
      ApiKeys.email: email,
      ApiKeys.message: message,
      ApiKeys.subject: subject,
      ApiKeys.createdAt: createdAt,
      ApiKeys.blog: blog?.toMap(),
    };
  }

  factory Message.fromJson(Map data) {
    return Message(
      blog: data[ApiKeys.blog] != null
          ? BlogData(
              title: data[ApiKeys.blog][ApiKeys.title],
              link: data[ApiKeys.blog][ApiKeys.link],
            )
          : null,
      createdAt: data[ApiKeys.createdAt] as Timestamp,
      name: data[ApiKeys.name],
      email: data[ApiKeys.email],
      message: data[ApiKeys.message],
      subject: data[ApiKeys.subject] != null
          ? data[ApiKeys.subject] as String
          : null,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        message,
        subject,
        blog,
        createdAt,
      ];
}
