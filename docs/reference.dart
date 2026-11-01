// ignore_for_file: unused_element, unused_field, unused_local_variable, unused_import
//
// CLOUTGRID FLUTTER REFERENCE
// ---------------------------------------------------------------------------
// Keep this file OUTSIDE lib/ (e.g. docs/). It is a cheat-sheet to copy from,
// not code that ships. Replace `Example` / `exampleProvider` with real names.
//
// Contents
//   Part 1  The four base widget classes
//   Part 2  Inline builders (small scoped rebuilds)
//   Part 3  State + Notifier patterns (Riverpod 3.x)
//   Part 4  Codegen samples (freezed, go_router_builder) - as comments
//   Part 5  Dart language features worth knowing
//   Part 6  Async patterns
//   Part 7  Gotchas (things that already bit this project)
//   Part 8  Command cheat-sheet
// ---------------------------------------------------------------------------

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ===========================================================================
// PART 1 - THE FOUR BASE CLASSES
//
// Decision guide:
//   Need local mutable state / controllers / lifecycle?   no  -> need providers?
//        no  -> StatelessWidget
//        yes -> ConsumerWidget
//   Need local mutable state / controllers / lifecycle?   yes -> need providers?
//        no  -> StatefulWidget
//        yes -> ConsumerStatefulWidget
// ===========================================================================

// ---------------------------------------------------------------------------
// 1. StatelessWidget - pure function of its constructor args.
//    Use for: presentational pieces (cards, rows, labels, buttons).
// ---------------------------------------------------------------------------
class ExampleStateless extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ExampleStateless({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(title, style: theme.textTheme.titleMedium),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 2. ConsumerWidget - stateless + `ref`. Rebuilds when watched providers change.
//    Use for: screens/widgets that only READ provider state.
//    No initState/dispose here. If you need those, use #4.
// ---------------------------------------------------------------------------
class ExampleConsumer extends ConsumerWidget {
  const ExampleConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch  -> rebuild on change. Only inside build.
    final state = ref.watch(exampleProvider);

    // select -> rebuild only when this one field changes.
    final isLoading = ref.watch(exampleProvider.select((s) => s.isLoading));

    // listen -> side effects (snackbar, navigation). Fires on CHANGE only,
    // not for the initial value. Allowed inside build.
    ref.listen(exampleProvider.select((s) => s.errorMessage), (prev, next) {
      if (next != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next)));
      }
    });

    return Column(
      children: [
        if (isLoading) const LinearProgressIndicator(),
        Text(state.items.length.toString()),
        FilledButton(
          // read -> one-off access in callbacks. NEVER in build for display.
          onPressed: () => ref.read(exampleProvider.notifier).refresh(),
          child: const Text('Refresh'),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// 3. StatefulWidget - widget + State object with lifecycle.
//    Use for: controllers (Text/Scroll/Animation/Page), focus nodes, timers,
//    local UI state (selected tab, expanded) with NO providers.
// ---------------------------------------------------------------------------
class ExampleStateful extends StatefulWidget {
  final String initialText;
  const ExampleStateful({super.key, this.initialText = ''});

  @override
  State<ExampleStateful> createState() => _ExampleStatefulState();
}

class _ExampleStatefulState extends State<ExampleStateful>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _controller;
  late final AnimationController _anim;
  final _focus = FocusNode();
  Timer? _debounce;
  int _selected = 0;

  // Runs ONCE. Create controllers here. No context-dependent lookups
  // (Theme.of / MediaQuery.of) - use didChangeDependencies for those.
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  // Runs after initState AND whenever an InheritedWidget you depend on
  // (Theme, MediaQuery, Localizations) changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // Parent rebuilt us with a NEW widget config. Compare old vs new.
  @override
  void didUpdateWidget(covariant ExampleStateful oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialText != widget.initialText) {
      _controller.text = widget.initialText;
    }
  }

  // Dispose EVERYTHING you created. Missed disposal = leaks / "setState after
  // dispose" errors.
  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _anim.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (!mounted) return; // always guard after async gaps
      setState(() => _selected = value.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: _focus,
      onChanged: _onChanged,
    );
  }
}

// ---------------------------------------------------------------------------
// 4. ConsumerStatefulWidget + ConsumerState - lifecycle AND `ref`.
//    Use for: most real screens (scroll controllers + provider fetch on open).
//    `ref` is available everywhere in the State (not just build).
// ---------------------------------------------------------------------------
class ExampleConsumerStateful extends ConsumerStatefulWidget {
  final int id;
  const ExampleConsumerStateful({super.key, required this.id});

  @override
  ConsumerState<ExampleConsumerStateful> createState() =>
      _ExampleConsumerStatefulState();
}

class _ExampleConsumerStatefulState
    extends ConsumerState<ExampleConsumerStateful> {
  final _scroll = ScrollController();

  // Capture the notifier early: `ref` is NOT safe to use in dispose()
  // ("Using ref when widget is unmounted").
  late final ExampleNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = ref.read(exampleProvider.notifier);

    // Provider writes during initState crash with "modify a provider while the
    // widget tree was building". Defer to after this frame:
    Future(() {
      if (!mounted) return;
      _notifier.load(widget.id);
    });

    _scroll.addListener(_onScroll);

    // listenManual = ref.listen usable outside build (initState).
    // fireImmediately gives the current value too - handy for cold-start
    // deep links where a plain listen would never fire.
    ref.listenManual(exampleProvider.select((s) => s.errorMessage), (
      prev,
      next,
    ) {
      if (next != null && mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next)));
      }
    });
  }

  void _onScroll() {
    final pos = _scroll.position;
    if (pos.pixels >= pos.maxScrollExtent - 200) {
      _notifier.loadMore();
    }
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    // Anything touching providers in dispose must ALSO be deferred:
    //   Future(() => _notifier.clear());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(exampleProvider.select((s) => s.items));
    return ListView.builder(
      controller: _scroll,
      itemCount: items.length,
      itemBuilder: (_, i) => ExampleStateless(title: items[i]),
    );
  }
}

// ===========================================================================
// PART 2 - INLINE BUILDERS
// Scope a rebuild (or add one piece of state) without a new class.
// ===========================================================================
class InlineBuilderExamples extends StatelessWidget {
  const InlineBuilderExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Consumer: a ref inside a plain Stateless/Stateful widget.
        Consumer(
          builder: (context, ref, child) {
            final n = ref.watch(exampleProvider.select((s) => s.items.length));
            return Text('$n items');
          },
        ),

        // StatefulBuilder: tiny local state, e.g. inside a dialog/sheet.
        StatefulBuilder(
          builder: (context, setState) {
            return Checkbox(value: true, onChanged: (_) => setState(() {}));
          },
        ),

        // Builder: gets a NEW BuildContext below the Scaffold, so
        // Scaffold.of(context) works.
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        // ValueListenableBuilder: rebuild from a ValueNotifier.
        // ListenableBuilder: same for any Listenable (controllers, etc.).
      ],
    );
  }
}

// ===========================================================================
// PART 3 - STATE + NOTIFIER (Riverpod 3.x, manual style)
// Project convention: state class lives INLINE in the notifier file.
// ===========================================================================
class ExampleState {
  final List<String> items;
  final bool isLoading;
  final String? errorMessage;
  final String? nextCursor;

  const ExampleState({
    this.items = const [],
    this.isLoading = false,
    this.errorMessage,
    this.nextCursor,
  });

  // clearX flags let you set a nullable field BACK to null
  // (copyWith(errorMessage: null) can't tell "unchanged" from "null").
  ExampleState copyWith({
    List<String>? items,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
    String? nextCursor,
    bool clearCursor = false,
  }) {
    return ExampleState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      nextCursor: clearCursor ? null : (nextCursor ?? this.nextCursor),
    );
  }
}

class ExampleNotifier extends Notifier<ExampleState> {
  bool _loadingMore = false; // local guard against duplicate pagination calls

  @override
  ExampleState build() => const ExampleState();

  Future<void> load(int id) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      // final res = await ref.read(apiServiceProvider).get('/things/$id/');
      state = state.copyWith(isLoading: false, items: ['a', 'b']);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> refresh() => load(0);

  Future<void> loadMore() async {
    if (_loadingMore || state.nextCursor == null) return;
    _loadingMore = true;
    try {
      // Cursor from backend is an ABSOLUTE url -> don't prefix the base url.
    } finally {
      _loadingMore = false;
    }
  }

  void clear() => state = const ExampleState();
}

final exampleProvider = NotifierProvider<ExampleNotifier, ExampleState>(
  ExampleNotifier.new,
);

// Other provider kinds:
//   Provider<T>             - computed/derived or DI (e.g. ApiService)
//   FutureProvider<T>       - one-off async value (AsyncValue<T>)
//   StreamProvider<T>       - streams
//   AsyncNotifierProvider   - async build() + mutations
//   .family                 - parameterised (in codegen: just add params)
//   .autoDispose            - freed when no listeners (default in codegen)
//
// AsyncValue handling (Riverpod 3.x: `.value`, NOT `.valueOrNull`):
//   final async = ref.watch(someFutureProvider);
//   async.when(data: ..., loading: ..., error: (e, st) => ...);
//   // or: switch (async) { AsyncData(:final value) => ..., AsyncError() => ..., _ => ... }
//
// Codegen equivalent (riverpod_annotation):
//   part 'example_notifier.g.dart';
//   @Riverpod(keepAlive: true)          // keepAlive for auth/session-like state
//   class ExampleNotifier extends _$ExampleNotifier {
//     @override ExampleState build() => const ExampleState();
//   }
//   // generated provider name drops "Notifier": exampleProvider

// ===========================================================================
// PART 4 - CODEGEN SAMPLES (comments only; need build_runner)
// ===========================================================================
//
// --- freezed 3.x -----------------------------------------------------------
//   import 'package:freezed_annotation/freezed_annotation.dart';
//   part 'user.freezed.dart';
//   part 'user.g.dart';
//
//   @freezed
//   abstract class User with _$User {            // `abstract` required in 3.x
//     const User._();                            // needed for custom getters
//     const factory User({
//       required int id,
//       @JsonKey(name: 'full_name') required String fullName,
//       String? avatar,
//     }) = _User;
//     factory User.fromJson(Map<String, dynamic> j) => _$UserFromJson(j);
//     String get initials => fullName.isEmpty ? '' : fullName[0];
//   }
//   // json_annotation must be a DIRECT dependency in pubspec.
//
// --- go_router_builder -----------------------------------------------------
//   part 'routes.g.dart';
//
//   @TypedGoRoute<ProfileRoute>(path: '/profile/:id')
//   class ProfileRoute extends GoRouteData with $ProfileRoute {  // mixin!
//     final int id;
//     final Object? $extra;                      // non-URL data
//     const ProfileRoute({required this.id, this.$extra});
//     @override
//     Widget build(BuildContext c, GoRouterState s) => ProfileScreen(id: id);
//   }
//   // navigate:  ProfileRoute(id: 3).push(context)   // keeps back stack
//   //            ProfileRoute(id: 3).go(context)     // replaces stack
//
// --- reactive router (redirect on auth change) -----------------------------
//   final appRouterProvider = Provider<GoRouter>((ref) {
//     // select ONLY what redirect needs, or the router rebuilds constantly.
//     final isAuth = ref.watch(authProvider.select((s) => s.isAuthenticated));
//     final isLoading = ref.watch(authProvider.select((s) => s.isLoading));
//     return GoRouter(redirect: (ctx, st) { /* ... */ });
//   });

// ===========================================================================
// PART 5 - DART LANGUAGE FEATURES WORTH KNOWING
// ===========================================================================

// Enhanced enum: fields, constructors, methods. (Store icon DATA, not widgets.)
enum CampaignTab {
  latest('Latest', 0),
  applied('Applied', 1),
  requests('Requests', 2);

  final String label;
  final int index_;
  const CampaignTab(this.label, this.index_);

  bool get isFirst => this == latest;
}

// Records: lightweight tuples. Great for returning 2 values (e.g. crop result).
(Object bytes, String ratio) cropResult() => ('bytes', '1:1');
void recordsDemo() {
  final (bytes, ratio) = cropResult(); // destructuring
  final named = (id: 1, name: 'x'); // named fields
  // print('${named.id} $ratio $bytes');
}

// Sealed classes + exhaustive switch: compiler forces you to handle all cases.
sealed class UiState {}

class UiLoading extends UiState {}

class UiData extends UiState {
  final List<String> items;
  UiData(this.items);
}

class UiError extends UiState {
  final String message;
  UiError(this.message);
}

String describe(UiState s) => switch (s) {
  UiLoading() => 'loading',
  UiData(:final items) => '${items.length} items', // destructure fields
  UiError(:final message) => 'error: $message',
};

// Pattern matching in if / switch with guards.
String bucket(int n) => switch (n) {
  0 => 'none',
  > 0 && < 10 => 'few',
  >= 10 => 'many',
  _ => 'negative',
};

// Extensions: add methods to types you don't own.
extension StringX on String {
  String get capitalized =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;
  Size get screen => MediaQuery.sizeOf(this); // sizeOf = rebuilds only on size
}

extension NumFormat on num {
  /// 1200 -> 1.2K, 3_400_000 -> 3.4M
  String get compact {
    if (this >= 1e6) return '${(this / 1e6).toStringAsFixed(1)}M';
    if (this >= 1e3) return '${(this / 1e3).toStringAsFixed(1)}K';
    return toString();
  }
}

// Null-aware operators.
void nullAware(String? a, Map<String, int>? m) {
  final x = a ?? 'default'; // fallback
  a ??= 'assigned'; // assign if null
  final len = a.length; // promoted to non-null after assignment
  final v = m?['k']; // short-circuit
  // final y = a!.trim(); // bang: only when you KNOW it's non-null
  // `late` = promise to init before first read (crashes if you lie).
}

// Collection if / for / spread - use inside widget `children:` lists.
List<Widget> collectionDemo(bool showHeader, List<String> names) => [
  if (showHeader) const Text('Header'),
  for (final n in names) Text(n),
  ...names.map(Text.new), // tear-off constructor
  if (names.isNotEmpty) ...[const Divider(), const Text('footer')],
];

// Named + required params, default values, and super parameters.
class Fancy extends StatelessWidget {
  final String label;
  final int count;
  const Fancy({super.key, required this.label, this.count = 0});
  @override
  Widget build(BuildContext context) => Text('$label $count');
}

// Cascade operator: chain calls on the same object.
void cascade() {
  final p = Paint()
    ..color = Colors.red
    ..strokeWidth = 2;
}

// ===========================================================================
// PART 6 - ASYNC PATTERNS
// ===========================================================================
Future<void> asyncPatterns(BuildContext context) async {
  // Parallel requests (all must succeed):
  final results = await Future.wait([Future.value(1), Future.value(2)]);

  // Fire-and-forget on purpose (silences the lint, documents intent):
  unawaited(Future.value());

  // Timeout:
  try {
    await Future.value().timeout(const Duration(seconds: 10));
  } on TimeoutException {
    // handle
  }

  // After ANY await, check the context is still alive before using it:
  await Future.delayed(const Duration(seconds: 1));
  if (!context.mounted) return; // in State: `if (!mounted) return;`
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(const SnackBar(content: Text('ok')));
}

// Cancel in dispose: Timer, StreamSubscription, AnimationController,
// ScrollController, TextEditingController, FocusNode, PageController,
// WebSocket channels.
//
//   late final StreamSubscription _sub;
//   _sub = stream.listen((e) {...});
//   dispose() { _sub.cancel(); super.dispose(); }
//
// Debounce: keep a Timer?, cancel it on each keystroke, start a new one.
// Throttle scroll loads with a bool guard (see ExampleNotifier._loadingMore).

// ===========================================================================
// PART 7 - GOTCHAS (each of these already cost time on Cloutgrid)
// ===========================================================================
//  1. "Modify a provider while the widget tree was building": any provider
//     write from initState/dispose/build -> wrap in Future(() {...}).
//  2. `ref` in dispose() throws -> capture the notifier in initState.
//  3. ref.listen fires on CHANGE only. Cold-start deep links need a one-time
//     deferred check of the current value (or listenManual fireImmediately).
//  4. Expanded / Flexible / Spacer need a BOUNDED parent (Row/Column with a
//     finite size). Inside a scroll view, give the child a fixed height or use
//     shrinkWrap Column children instead.
//  5. ListView inside Column -> wrap in Expanded. ListView inside a scroll
//     view -> shrinkWrap: true + NeverScrollableScrollPhysics() (or use slivers).
//  6. Container: `color:` and `decoration:` cannot both be set - put color
//     inside BoxDecoration.
//  7. Dismissible + rounded corners leaves a gap: one ClipRRect OUTSIDE the
//     Dismissible, plain-rect children inside.
//  8. Keyboard: Scaffold already resizes for the keyboard; don't ALSO add
//     viewInsets.bottom padding or you double-count.
//  9. Icon size vs reserved box: InputDecoration needs suffixIconConstraints
//     if the icon looks clipped/oversized.
// 10. hugeicons: `HugeIcons.x` is icon DATA, not IconData and not a widget.
//     Store it as `dynamic`/typed data; build `HugeIcon(icon:, size:, color:)`
//     at the render site so size/color are controllable.
// 11. Android RELEASE builds need <uses-permission INTERNET> in the MAIN
//     manifest (debug has it implicitly) - "works in debug, no network in
//     release" is always this.
// 12. Launcher icon vanished? MAIN/LAUNCHER and VIEW(deep link) must be in
//     SEPARATE <intent-filter> blocks.
// 13. url_launcher on Android 11+ needs <queries> with an https VIEW intent.
// 14. Cleartext http / iOS ATS: http:// and `localhost` base URLs are blocked
//     outside debug without exceptions. Use https for anything real.
// 15. versionCode must strictly increase for Play (pubspec: 1.0.3+23 -> the
//     +23 is versionCode / build number). Check the live code first.
// 16. targetSdk 36 required by Play from Aug 31 2026.
// 17. Signing: key.properties needs `import java.util.Properties` and
//     `import java.io.FileInputStream` at the top of build.gradle.kts.
//     Never commit key.properties or the keystore.
// 18. flutter_image_compress on iOS: Podfile needs use_frameworks! and
//     use_modular_headers!; then `pod deintegrate && pod install`.
//     MissingPluginException after adding a plugin -> FULL restart, not hot reload.
// 19. Edge-to-edge: SystemChrome edgeToEdge + AnnotatedRegion<SystemUiOverlayStyle>
//     at app root; Android styles.xml with transparent bars and
//     enforceNavigationBarContrast=false (fixes black nav bar on Android 12).
// 20. build_runner stale outputs -> `dart run build_runner clean` then build.
//     `part` filename must match the file exactly (typos silently break it).
// 21. Pagination with absolute `next` URLs: don't re-prefix the base url
//     (fullUrl flag), and don't clear nextCursor before the fetch succeeds.
// 22. Reverse chat lists: ListView(reverse: true) - "load older" triggers at
//     maxScrollExtent, newest is index 0.
// 23. Hot reload does NOT re-run main(), initState of existing widgets, or
//     static/const initialisers. Use hot RESTART (R) for those. Native changes
//     (manifest, Podfile, gradle, plugins) need a full stop + run.
//
// Bonus: prefer `const` constructors everywhere you can (skips rebuilds);
// prefer MediaQuery.sizeOf / paddingOf over MediaQuery.of (narrower rebuilds);
// `withValues(alpha:)` replaces the deprecated `withOpacity`;
// give list items stable `key: ValueKey(id)` when they can reorder/delete.

// ===========================================================================
// PART 8 - COMMAND CHEAT-SHEET
// ===========================================================================
//  flutter run                              run on connected device
//  flutter run --release                    test release behaviour (network!)
//  flutter analyze                          static analysis
//  flutter clean && flutter pub get         reset build state
//  flutter pub upgrade --major-versions     bump deps (review diff!)
//  dart run build_runner build              one-off codegen
//  dart run build_runner watch              regenerate on save
//  dart run build_runner clean              wipe stale generated files
//  dart run flutter_launcher_icons          regenerate app icons
//  dart run flutter_native_splash:create    regenerate splash
//  flutter build appbundle --release        Android .aab for Play
//  flutter build apk --release              installable .apk
//  flutter build ipa --release              iOS archive for App Store
//  flutter doctor -v                        toolchain health
//  flutter devices / flutter emulators      list targets
//
//  pubspec version:  version: 1.0.3+23     (name+buildNumber)
//                    -> Android versionName=1.0.3 versionCode=23
//                    -> iOS CFBundleShortVersionString / CFBundleVersion
//
//  Splash control (flutter_native_splash):
//    FlutterNativeSplash.preserve(widgetsBinding: binding);  // in main
//    FlutterNativeSplash.remove();                           // when ready
//
//  VS Code auto hot-reload on save (settings.json):
//    "dart.flutterHotReloadOnSave": "all"

// ---------------------------------------------------------------------------
// Placeholder so this file is self-contained if ever analyzed.
// ---------------------------------------------------------------------------
void main() {}
