import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/widget/deferred_loader_widget.dart';

import '../../features/about/presentation/about_screen.dart'
    deferred as about_screen;
import '../../features/contact/presentation/contact_screen.dart'
    deferred as contact_screen;
import '../../features/error/page_not_found_screen.dart'
    deferred as error_screen;
import '../../features/home/presentation/home_screen.dart';
import '../../features/services/presentation/services_screen.dart'
    deferred as services_screen;

import '../../features/blogs/presentation/blogs_screen.dart'
    deferred as blogs_screen;

abstract class AppRouter {
  static const home = '/home';
  static const services = '/services';
  static const about = '/about';
  static const contact = '/contact';
  static const blogs = '/blogs';

  static final router = GoRouter(
    initialLocation: blogs,//TODO: change to home
    routes: [
      GoRoute(path: home, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: about,
        builder: (context, state) {
          return DeferredWidget(
            libraryFuture: about_screen.loadLibrary(),
            widgetBuilder: () => about_screen.AboutScreen(),
          );
        },
      ),
      GoRoute(
        path: services,
        builder: (context, state) {
          return DeferredWidget(
            libraryFuture: services_screen.loadLibrary(),
            widgetBuilder: () => services_screen.ServicesScreen(),
          );
        },
      ),
      GoRoute(
        path: blogs,
        builder: (context, state) {
          return DeferredWidget(
            libraryFuture: blogs_screen.loadLibrary(),
            widgetBuilder: () => blogs_screen.BlogsScreen(),
          );
        },
      ),
      GoRoute(
        path: contact,
        builder: (context, state) {
          return DeferredWidget(
            libraryFuture: contact_screen.loadLibrary(),
            widgetBuilder: () => contact_screen.ContactScreen(),
          );
        },
      ),
    ],
    errorBuilder: (context, state) {
      return DeferredWidget(
        libraryFuture: error_screen.loadLibrary(),
        widgetBuilder: () => error_screen.PageNotFoundScreen(),
      );
    },
  );
}
