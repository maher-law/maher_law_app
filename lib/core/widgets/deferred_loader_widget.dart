import 'package:flutter/material.dart';

class DeferredWidget extends StatelessWidget {
  final Future<void> libraryFuture;
  final Widget Function() widgetBuilder;

  const DeferredWidget({
    super.key,
    required this.libraryFuture,
    required this.widgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: libraryFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return widgetBuilder();
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}


