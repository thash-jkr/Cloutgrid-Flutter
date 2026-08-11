import 'dart:typed_data';

import 'package:cloutgrid_flutter/presentation/create/create_post.dart';
import 'package:cloutgrid_flutter/presentation/jobs/questions.dart';
import 'package:cloutgrid_flutter/presentation/profile/edit_profile.dart';
import 'package:cloutgrid_flutter/presentation/profile/other_profile.dart';
import 'package:cloutgrid_flutter/presentation/profile/post_detail.dart';
import 'package:cloutgrid_flutter/presentation/profile/security.dart';
import 'package:cloutgrid_flutter/presentation/profile/settings.dart';
import 'package:cloutgrid_flutter/presentation/tab_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    onNavigateToEditProfile: () => EditProfileRoute().push(context),
    onNavigateToOtherProfile: (String username, String type) =>
        OtherProfileRoute(username: username, type: type).push(context),
    onNavigateToCreatePost: (Uint8List bytes) =>
        CreatePostRoute($extra: bytes).push(context),
    onNavigateToQuestions: (int id) => QuestionsRoute(id: id).push(context),
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

@TypedGoRoute<EditProfileRoute>(path: "/edit-profile")
class EditProfileRoute extends GoRouteData with $EditProfileRoute {
  const EditProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      EditProfile(onNavigateBack: () => context.pop());
}

@TypedGoRoute<OtherProfileRoute>(path: "/other-profile")
class OtherProfileRoute extends GoRouteData with $OtherProfileRoute {
  final String username;
  final String type;

  const OtherProfileRoute({required this.username, required this.type});

  @override
  Widget build(BuildContext context, GoRouterState state) => OtherProfile(
    onNavigateBack: () => context.pop(),
    onNavigateToPostDetail: (int id, bool other) =>
        PostDetailRoute(id: id, other: other).push(context),
    username: username,
    type: type,
  );
}

@TypedGoRoute<CreatePostRoute>(path: "/create-post")
class CreatePostRoute extends GoRouteData with $CreatePostRoute {
  final Uint8List $extra;

  const CreatePostRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CreatePost(selectedImage: $extra, onNavigateBack: () => context.pop());
}

@TypedGoRoute<QuestionsRoute>(path: "/questions")
class QuestionsRoute extends GoRouteData with $QuestionsRoute {
  final int id;

  const QuestionsRoute({required this.id});

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      Questions(onNavigateBack: () => context.pop(), id: id);
}

const _publicPaths = ['/', '/login', '/register', '/reset-password'];

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final isLoading = ref.watch(authProvider.select((s) => s.isLoading));
  final isAuth = ref.watch(
    authProvider.select((s) => s.value?.isAuth ?? false),
  );

  return GoRouter(
    routes: $appRoutes,
    initialLocation: '/',
    redirect: (context, state) {
      final path = state.uri.path;

      if (isLoading) return null;

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
