import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';


import '../../../../../core/di/debendency_injection.dart';
import '../../../../../core/models/blog_model.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit(this.blog) : super(BlogInitial());
  Blog? blog;

  late QuillController controller;

  void initController(BuildContext context) async {
    if (blog == null) {
      await getBlog(context);
    } else {
      emit(BlogSuccess());
    }
    controller = QuillController(
      document: Document.fromJson(
        jsonDecode(blog!.contentJson),
      ),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: true,
    );
  }

  Future<void> getBlog(BuildContext context) async {
    emit(BlogLoading());
    String route = GoRouter.of(
      context,
    ).routeInformationProvider.value.uri.toString();

    try {
      String id = route.split('/')[2];
      // print(id);
      var blogDoc = await getIt<FirebaseFirestore>()
          .collection(ApiKeys.blogsCollection)
          .doc(id)
          .get();

      blog = Blog.fromFirestore(blogDoc.id, data: blogDoc.data()!);
      emit(BlogSuccess());
    }  catch (_) {
      emit(BlogFailure());
    }

    // Seo.head(
    //   title: blog.title,
    //   description: post.summary,
    //   keywords: post.keywords,
    //   socialMeta: SocialMeta(
    //     ogTitle: post.title,
    //     ogDescription: post.summary,
    //     ogImage: post.thumbnailUrl,
    //   ),
    // );

  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
