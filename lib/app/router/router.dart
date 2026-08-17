import 'dart:typed_data';

import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/presentation/auth/register_begin.dart';
import 'package:cloutgrid_flutter/presentation/auth/register_end.dart';
import 'package:cloutgrid_flutter/presentation/auth/reset_password.dart';
import 'package:cloutgrid_flutter/presentation/chats/conversations.dart';
import 'package:cloutgrid_flutter/presentation/chats/messages.dart';
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
    onNavigateToRegister: () => RegisterBeginRoute().push(context),
  );
}

@TypedGoRoute<RegisterBeginRoute>(path: '/register-begin')
class RegisterBeginRoute extends GoRouteData with $RegisterBeginRoute {
  const RegisterBeginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => RegisterBegin(
    onNavigateBack: () => context.pop(),
    onNavigateToMoreInfo: (Map<String, String> basicInfo) =>
        RegisterEndRoute($extra: basicInfo).push(context),
  );
}

@TypedGoRoute<RegisterEndRoute>(path: '/register-end')
class RegisterEndRoute extends GoRouteData with $RegisterEndRoute {
  final Map<String, String> $extra;

  const RegisterEndRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) => RegisterEnd(
    basicInfo: $extra,
    onNavigateBack: () => context.pop(),
    onNavigateToLogin: () => () {
      const LandingRoute().go(context);
      const LoginRoute().push(context);
    },
  );
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData with $LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => LoginScreen(
    onNavigateBack: () => context.pop(),
    onNavigateToResetPassword: () => ResetPasswordRoute().push(context),
  );
}

@TypedGoRoute<ResetPasswordRoute>(path: '/reset-password')
class ResetPasswordRoute extends GoRouteData with $ResetPasswordRoute {
  const ResetPasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ResetPassword(onNavigateBack: () => context.pop());
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
    onNavigateToOtherProfile: (UserContainer user) =>
        OtherProfileRoute($extra: user).push(context),
    onNavigateToCreatePost: (Uint8List bytes) =>
        CreatePostRoute($extra: bytes).push(context),
    onNavigateToQuestions: (int id) => QuestionsRoute(id: id).push(context),
    onNavigateToConversations: () => ConversationsRoute().push(context),
  );
}

@TypedGoRoute<ConversationsRoute>(path: '/conversations')
class ConversationsRoute extends GoRouteData with $ConversationsRoute {
  const ConversationsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Conversations(
    onNavigateBack: () => context.pop(),
    onNavigateToMessages: (String id, String username, String profilePhoto) =>
        MessagesRoute(
          id: id,
          username: username,
          profilePhoto: profilePhoto,
        ).push(context),
  );
}

@TypedGoRoute<MessagesRoute>(path: '/messages')
class MessagesRoute extends GoRouteData with $MessagesRoute {
  final String id;
  final String username;
  final String profilePhoto;

  const MessagesRoute({
    required this.id,
    required this.username,
    required this.profilePhoto,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) => Messages(
    onNavigateBack: () => context.pop(),
    id: id,
    username: username,
    profilePhoto: profilePhoto,
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

@TypedGoRoute<OtherProfileRoute>(path: '/other-profile')
class OtherProfileRoute extends GoRouteData with $OtherProfileRoute {
  final UserContainer $extra;

  const OtherProfileRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) => OtherProfile(
    onNavigateBack: () => context.pop(),
    onNavigateToPostDetail: (int id, bool other) =>
        PostDetailRoute(id: id, other: other).push(context),
    user: $extra,
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

const _publicPaths = [
  '/',
  '/login',
  '/register-begin',
  '/register-end',
  '/reset-password',
];

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
