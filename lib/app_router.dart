import 'package:discover_me/pages/login/auth_page_widget.dart';
import 'package:discover_me/pages/onboarding/basic_info_widget.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const AuthPageWidget(),
    ),
    GoRoute(
      path: '/onboarding/basic-info',
      name: 'basic-info',
      builder: (context, state) => const BasicInfoWidget(),
    ),
    // GoRoute(
    //   path: '/onboarding/basic-info/:type',
    //   name: 'basicInfo',
    //   builder: (context, state) {
    //     final type = state.pathParameters['type']!;
    //     return BasicInfoPage(type: type);
    //   },
    // ),
  ],
);
