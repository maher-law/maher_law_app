import 'package:go_router/go_router.dart';
import 'package:maher_law_app/core/widget/deferred_loader_widget.dart';
import 'package:maher_law_app/core/models/blog_model.dart';
import 'package:maher_law_app/features/blog/presentation/blog_screen.dart'
    deferred as blog_screen;

import '../../features/about/presentation/about_screen.dart'
    deferred as about_screen;
import '../../features/all_blogs/presentation/all_blogs_screen.dart'
    deferred as blogs_screen;
import '../../features/contact/presentation/contact_screen.dart'
    deferred as contact_screen;
import '../../features/error/page_not_found_screen.dart'
    deferred as error_screen;
import '../../features/home/presentation/home_screen.dart';
import '../../features/services/presentation/services_screen.dart'
    deferred as services_screen;

abstract class AppRouter {
  static const home = '/home';
  static const services = '/services';
  static const about = '/about';
  static const contact = '/contact';
  static const blogs = '/blogs';

  static final router = GoRouter(
    initialLocation: blogs, //TODO: change to home
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
            widgetBuilder: () => blogs_screen.AllBlogsScreen(),
          );
        },
      ),
      GoRoute(
        path: '$blogs/:${ApiKeys.slug}',
        builder: (context, state) {
          return DeferredWidget(
            libraryFuture: blog_screen.loadLibrary(),
            widgetBuilder: () => blog_screen.BlogScreen(
              blog: state.extra as Blog?,
            ),
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
