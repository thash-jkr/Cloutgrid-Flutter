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
  Widget build(BuildContext context, GoRouterState state) =>
      const TabNavigator();
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
