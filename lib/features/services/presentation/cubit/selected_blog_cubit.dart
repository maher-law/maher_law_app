import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/service_blog_model.dart';

class SelectedBlogCubit extends Cubit<ServiceBlogModel> {
  SelectedBlogCubit() : super(blogs[0]);

  void selectBlog(ServiceBlogModel blog) {
    emit(blog);
  }
}
