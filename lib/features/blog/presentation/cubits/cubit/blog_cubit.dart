import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:maher_law_app/core/app_constants.dart';

import '../../../../../core/models/blog_model.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit(this.blog) : super(BlogInitial());
  final Blog? blog;

  late QuillController controller;

  void initController(BuildContext context) {
    controller = QuillController(
      document: Document.fromJson(
        jsonDecode(AppConstants.textBlogContentJson),
      ),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );

    // if (blog != null) {
    //   controller = QuillController(
    //     document: Document.fromJson(
    //       jsonDecode(blog?.contentJson ?? AppConstants.textBlogContentJson),
    //     ),
    //     selection: const TextSelection.collapsed(offset: 0),
    //     readOnly: true,
    //   );
    // } else {
    //   String slug = GoRouter.of(
    //     context,
    //   ).routeInformationProvider.value.uri.toString();

    //   print('slug');
    // }
  }
}
