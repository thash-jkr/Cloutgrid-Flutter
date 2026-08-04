import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/auth/auth_models.dart';

LinearGradient createEasedGradient({
  required Color beginColor,
  required Color endColor,
  Curve curve = Curves.easeIn,
  int steps = 16,
  AlignmentGeometry begin = Alignment.topCenter,
  AlignmentGeometry end = Alignment.bottomCenter,
}) {
  final List<Color> colors = [];
  final List<double> stops = [];

  for (int i = 0; i <= steps; i++) {
    // 1. Calculate linear ratio (0.0 to 1.0)
    final double t = i / steps;

    // 2. Transform the ratio using Flutter's native Curve class
    final double curvedT = curve.transform(t);

    // 3. Linearly interpolate the color using the curved value
    colors.add(Color.lerp(beginColor, endColor, curvedT)!);
    stops.add(t);
  }

  return LinearGradient(begin: begin, end: end, colors: colors, stops: stops);
}

class CloutHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final HeaderAction? icon;
  final List<HeaderAction> actions;

  const CloutHeader({
    super.key,
    this.title,
    this.icon,
    this.actions = const [],
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var offWhite = theme.colorScheme.surface;

    final gradientColors = [
      offWhite.withValues(alpha: 1.0),
      offWhite.withValues(alpha: 0.8),
      offWhite.withValues(alpha: 0.6),
      offWhite.withValues(alpha: 0.5),
      offWhite.withValues(alpha: 0.4),
      offWhite.withValues(alpha: 0.3),
      offWhite.withValues(alpha: 0.25),
      offWhite.withValues(alpha: 0.2),
      offWhite.withValues(alpha: 0.15),
      offWhite.withValues(alpha: 0.1),
      offWhite.withValues(alpha: 0.05),
      offWhite.withValues(alpha: 0.0),
    ];

    // return GradientBlur(
    //   maxBlur: 10.0,
    //   minBlur: 0.0,
    //   slices: 10,
    //   curve: Curves.linear,
    //   edgeBlur: null,
    //   gradient: LinearGradient(
    //     colors: [
    //       Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.1),
    //       Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.0),
    //     ],
    //     begin: Alignment.topCenter,
    //     end: Alignment.bottomCenter,
    //   ),
    //   child: AppBar(
    //     backgroundColor: Colors.transparent,
    //     scrolledUnderElevation: 0,
    //     automaticallyImplyLeading: false,
    //     elevation: 0,
    //     centerTitle: icon == null && actions.isEmpty,
    //     systemOverlayStyle: const SystemUiOverlayStyle(
    //       statusBarColor: Colors.transparent,
    //       statusBarIconBrightness: Brightness.dark,
    //       statusBarBrightness: Brightness
    //           .light, // iOS uses this instead of statusBarIconBrightness
    //       systemNavigationBarColor: Colors.transparent,
    //       systemNavigationBarIconBrightness: Brightness.dark,
    //       systemNavigationBarContrastEnforced: false,
    //     ),
    //     leadingWidth: 60,
    //     title: title != null
    //         ? Text(title!, style: const TextStyle(fontWeight: FontWeight.bold))
    //         : null,
    //     leading: icon != null
    //         ? Padding(
    //             padding: const EdgeInsets.only(left: 15),
    //             child: _ToolbarButton(action: icon!),
    //           )
    //         : null,
    //     actions: actions
    //         .map(
    //           (action) => Padding(
    //             padding: const EdgeInsets.only(right: 15),
    //             child: _ActionButton(action: action),
    //           ),
    //         )
    //         .toList(),
    //   ),
    // );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors,
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: icon == null && actions.isEmpty,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness
              .light, // iOS uses this instead of statusBarIconBrightness
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        ),
        leadingWidth: 60,
        title: title != null
            ? Text(title!, style: const TextStyle(fontWeight: FontWeight.bold))
            : null,
        leading: icon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 15),
                child: _ToolbarButton(action: icon!),
              )
            : null,
        actions: actions
            .map(
              (action) => Padding(
                padding: const EdgeInsets.only(right: 15),
                child: _ActionButton(action: action),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  final HeaderAction action;
  const _ToolbarButton({required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: action.image != null
            ? Image(image: action.image!, width: 50, height: 50)
            : action.icon != null
            ? Icon(action.icon, size: 25)
            : const SizedBox.shrink(),
        tooltip: action.contentDescription,
        onPressed: action.onClick,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final HeaderAction action;
  const _ActionButton({required this.action});

  @override
  Widget build(BuildContext context) {
    final hasMenu = action.menuItems != null && action.menuItems!.isNotEmpty;

    if (!hasMenu) {
      return _ToolbarButton(action: action);
    }

    return PopupMenuButton<void>(
      icon: Icon(action.icon),
      tooltip: action.contentDescription,
      color: Colors.white,
      offset: const Offset(0, 5),
      itemBuilder: (context) => action.menuItems!
          .map(
            (item) => PopupMenuItem<void>(
              onTap: item.onClick,
              child: Row(
                children: [Icon(item.icon, size: 25), Text(item.title)],
              ),
            ),
          )
          .toList(),
    );
  }
}
