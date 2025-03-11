import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../cubits/cubit/blog_cubit.dart';

class BlogTextContent extends StatelessWidget {
  const BlogTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return QuillEditor.basic(
      controller: context.read<BlogCubit>().controller,
      config: QuillEditorConfig(
        showCursor: false,
        readOnlyMouseCursor: SystemMouseCursors.basic,
      ),
    );
  }
}
