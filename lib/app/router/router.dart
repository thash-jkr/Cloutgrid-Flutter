import 'package:cloutgrid_flutter/presentation/profile/post_detail.dart';
import 'package:cloutgrid_flutter/presentation/profile/security.dart';
import 'package:cloutgrid_flutter/presentation/profile/settings.dart';
import 'package:cloutgrid_flutter/presentation/tab_navigator.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../providers/auth/auth_notifier.dart';
import '../../presentation/auth/landing_screen.dart';
import '../../presentation/auth/login_screen.dart';

part 'router.g.dart';

@TypedGoRoute<LandingRoute>(path: '/')
class LandingRoute extends GoRouteData with $LandingRoute {
  const LandingRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => LandingScreen(
    onNavigateToLogin: () => const LoginRoute().push(context),
    onNavigateToRegister: () {},
  );
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => LoginScreen(
    onNavigateBack: () => context.pop(),
    onNavigateToResetPassword: () {},
  );
}

@TypedGoRoute<TabsRoute>(path: '/tabs')
class TabsRoute extends GoRouteData with $TabsRoute {
  const TabsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => TabNavigator(
    onNavigateToSettings: () => SettingsRoute().push(context),
    onNavigateToPostDetail: (int id, bool other) =>
        PostDetailRoute(id: id, other: other).push(context),
  );
}

@TypedGoRoute<SettingsRoute>(path: "/settings")
class SettingsRoute extends GoRouteData with $SettingsRoute {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Settings(
    onNavigateBack: () => context.pop(),
    onNavigateToSecurity: () => SecurityRoute().push(context),
  );
}

@TypedGoRoute<SecurityRoute>(path: "/security")
class SecurityRoute extends GoRouteData with $SecurityRoute {
  const SecurityRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      Security(onNavigateBack: () => context.pop());
}

@TypedGoRoute<PostDetailRoute>(path: "/post-detail")
class PostDetailRoute extends GoRouteData with $PostDetailRoute {
  final int id;
  final bool other;

  const PostDetailRoute({required this.id, required this.other});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      PostDetail(onNavigateBack: () => context.pop(), id: id, other: other);
}

const _publicPaths = ['/', '/login', '/register', '/reset-password'];

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    routes: $appRoutes,
    initialLocation: '/',
    redirect: (context, state) {
      final path = state.uri.path;

      if (authState.isLoading) return null;

      final isAuth = authState.value?.isAuth ?? false;
      final isPublicRoute = _publicPaths.contains(path);

      if (!isAuth && !isPublicRoute) {
        return '/';
      }

      if (isAuth && isPublicRoute) {
        return '/tabs';
      }

      return null;
    },
  );
}
