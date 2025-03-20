// import 'package:go_router/go_router.dart';
// import 'package:maher_law_app/core/api_keys.dart';
// import 'package:maher_law_app/core/models/blog_model.dart';
// import 'package:maher_law_app/features/blog/presentation/blog_screen.dart';

// import '../../features/home/presentation/home_screen.dart';

// abstract class AppRouter {
//   static const home = '/home';
//   static const services = '/services';
//   static const about = '/about';
//   static const contact = '/contact';
//   static const blogs = '/blogs';
//   static const consultation = '/consultation';

//   static final router = GoRouter(
//     initialLocation: home,
//     routes: [
//       GoRoute(path: home, builder: (context, state) => const HomeScreen()),
//       GoRoute(
//         path: '$blogs/:${ApiKeys.id}/:${ApiKeys.slug}',
//         builder: (context, state) {
//           return BlogScreen(blog: state.extra as Blog?);
//         },
//       ),
//     ],
//   );
// }
