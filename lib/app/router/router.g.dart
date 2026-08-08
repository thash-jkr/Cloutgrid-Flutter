// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $landingRoute,
  $loginRoute,
  $tabsRoute,
  $settingsRoute,
  $securityRoute,
  $postDetailRoute,
  $editProfileRoute,
  $otherProfileRoute,
  $createPostRoute,
];

RouteBase get $landingRoute => GoRouteData.$route(
  path: '/',
  hasOverriddenOnExit: false,
  factory: $LandingRoute._fromState,
);

mixin $LandingRoute on GoRouteData {
  static LandingRoute _fromState(GoRouterState state) => const LandingRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
  path: '/login',
  hasOverriddenOnExit: false,
  factory: $LoginRoute._fromState,
);

mixin $LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tabsRoute => GoRouteData.$route(
  path: '/tabs',
  hasOverriddenOnExit: false,
  factory: $TabsRoute._fromState,
);

mixin $TabsRoute on GoRouteData {
  static TabsRoute _fromState(GoRouterState state) => const TabsRoute();

  @override
  String get location => GoRouteData.$location('/tabs');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
  path: '/settings',
  hasOverriddenOnExit: false,
  factory: $SettingsRoute._fromState,
);

mixin $SettingsRoute on GoRouteData {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $securityRoute => GoRouteData.$route(
  path: '/security',
  hasOverriddenOnExit: false,
  factory: $SecurityRoute._fromState,
);

mixin $SecurityRoute on GoRouteData {
  static SecurityRoute _fromState(GoRouterState state) => const SecurityRoute();

  @override
  String get location => GoRouteData.$location('/security');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $postDetailRoute => GoRouteData.$route(
  path: '/post-detail',
  hasOverriddenOnExit: false,
  factory: $PostDetailRoute._fromState,
);

mixin $PostDetailRoute on GoRouteData {
  static PostDetailRoute _fromState(GoRouterState state) => PostDetailRoute(
    id: int.parse(state.uri.queryParameters['id']!),
    other: _$boolConverter(state.uri.queryParameters['other']!),
  );

  PostDetailRoute get _self => this as PostDetailRoute;

  @override
  String get location => GoRouteData.$location(
    '/post-detail',
    queryParams: {'id': _self.id.toString(), 'other': _self.other.toString()},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $editProfileRoute => GoRouteData.$route(
  path: '/edit-profile',
  hasOverriddenOnExit: false,
  factory: $EditProfileRoute._fromState,
);

mixin $EditProfileRoute on GoRouteData {
  static EditProfileRoute _fromState(GoRouterState state) =>
      const EditProfileRoute();

  @override
  String get location => GoRouteData.$location('/edit-profile');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $otherProfileRoute => GoRouteData.$route(
  path: '/other-profile',
  hasOverriddenOnExit: false,
  factory: $OtherProfileRoute._fromState,
);

mixin $OtherProfileRoute on GoRouteData {
  static OtherProfileRoute _fromState(GoRouterState state) => OtherProfileRoute(
    username: state.uri.queryParameters['username']!,
    type: state.uri.queryParameters['type']!,
  );

  OtherProfileRoute get _self => this as OtherProfileRoute;

  @override
  String get location => GoRouteData.$location(
    '/other-profile',
    queryParams: {'username': _self.username, 'type': _self.type},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createPostRoute => GoRouteData.$route(
  path: '/create-post',
  hasOverriddenOnExit: false,
  factory: $CreatePostRoute._fromState,
);

mixin $CreatePostRoute on GoRouteData {
  static CreatePostRoute _fromState(GoRouterState state) =>
      CreatePostRoute($extra: state.extra as Uint8List);

  CreatePostRoute get _self => this as CreatePostRoute;

  @override
  String get location => GoRouteData.$location('/create-post');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appRouter)
final appRouterProvider = AppRouterProvider._();

final class AppRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  AppRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appRouterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return appRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$appRouterHash() => r'd58291c4b32f82a21362a036a60bf5fd005cf348';
