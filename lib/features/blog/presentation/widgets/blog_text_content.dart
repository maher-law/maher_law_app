import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../cubits/blog_cubit/blog_cubit.dart';

class BlogTextContent extends StatelessWidget {
  const BlogTextContent({super.key});

  @override
  Widget build(BuildContext context) {
    return QuillEditor.basic(
      controller: context.read<BlogCubit>().controller,
      config: const QuillEditorConfig(
        showCursor: false,
        readOnlyMouseCursor: SystemMouseCursors.basic,
        customStyles: DefaultStyles(
          paragraph: DefaultTextBlockStyle(
            TextStyle(color: Colors.black),
            HorizontalSpacing(0, 0),
            VerticalSpacing(0, 0),
            VerticalSpacing(0, 0),
            BoxDecoration(),
          ),
          color: Colors.black,
          bold: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
