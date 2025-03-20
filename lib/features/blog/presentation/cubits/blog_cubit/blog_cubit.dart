import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:go_router/go_router.dart';
// import 'package:meta_seo/meta_seo.dart';

import '../../../../../core/api_keys.dart';
import '../../../../../core/di/debendency_injection.dart';
import '../../../../../core/models/blog_model.dart';

part 'blog_state.dart';

class BlogCubit extends Cubit<BlogState> {
  BlogCubit(this.blog) : super(BlogInitial());
  Blog? blog;

  late QuillController controller;

  void initSeo() {
    // if (kIsWeb) {
    //   MetaSEO meta = MetaSEO();

    //   meta.ogTitle(ogTitle: blog!.title);
    //   meta.description(description: blog!.title);
    //   meta.keywords(keywords: blog!.tags?.join('، ') ?? 'محاماة، عقود، قانون');
    //   meta.propertyContent(property: 'copyright', content: 'الوسيط القانوني');
    // }
  }

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

    initSeo();
  }

  Future<void> getBlog(BuildContext context) async {
    emit(BlogLoading());
    String route = GoRouter.of(
      context,
    ).routeInformationProvider.value.uri.toString();

    try {
      String id = route.split('/')[2];

      var blogDoc = await getIt<FirebaseFirestore>()
          .collection(ApiKeys.blogsCollection)
          .doc(id)
          .get();

      blog = Blog.fromFirestore(blogDoc.id, data: blogDoc.data()!);
      emit(BlogSuccess());
    } catch (_) {
      emit(BlogFailure());
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
