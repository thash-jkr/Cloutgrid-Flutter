import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/auth/auth_models.dart';

class OutlinedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color outlineColor;
  final double outlineWidth;

  const OutlinedText({
    super.key,
    required this.text,
    required this.style,
    this.outlineColor = Colors.white,
    this.outlineWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: style.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = outlineWidth
              ..color = outlineColor,
          ),
        ),
        Text(text, style: style),
      ],
    );
  }
}

class CloutHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final HeaderAction? icon;
  final List<HeaderAction> actions;
  final bool center;

  const CloutHeader({
    super.key,
    this.title,
    this.icon,
    this.actions = const [],
    this.center = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var offWhite = theme.colorScheme.surface;

    final gradientColors = [
      // offWhite.withValues(alpha: 0.7),
      // offWhite.withValues(alpha: 0.65),
      // offWhite.withValues(alpha: 0.6),
      // offWhite.withValues(alpha: 0.55),
      // offWhite.withValues(alpha: 0.5),
      // offWhite.withValues(alpha: 0.45),
      // offWhite.withValues(alpha: 0.4),
      // offWhite.withValues(alpha: 0.35),
      offWhite.withValues(alpha: 0.3),
      offWhite.withValues(alpha: 0.25),
      offWhite.withValues(alpha: 0.2),
      offWhite.withValues(alpha: 0.15),
      offWhite.withValues(alpha: 0.1),
      offWhite.withValues(alpha: 0.05),
      offWhite.withValues(alpha: 0.0),
    ];

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
        centerTitle: center,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        ),
        leadingWidth: 60,
        title: title != null
            ? OutlinedText(
                text: title!,
                style: const TextStyle(fontWeight: FontWeight.bold),
                outlineColor: theme.colorScheme.surface,
                outlineWidth: 3,
              )
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
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 0,
            spreadRadius: 1,
            offset: const Offset(0, 0),
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
        onPressed: action.disabled ? null : action.onClick,
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

    return Container(
      width: 45,
      height: 45,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 0,
            spreadRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: PopupMenuButton<void>(
        icon: Icon(action.icon),
        tooltip: action.contentDescription,
        color: Colors.white,
        offset: const Offset(0, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.zero,
        menuPadding: EdgeInsets.zero,
        itemBuilder: (context) => action.menuItems!
            .map(
              (item) => PopupMenuItem<void>(
                onTap: item.onClick,
                child: Row(
                  children: [
                    Icon(item.icon, size: 25),
                    SizedBox(width: 12),
                    Text(item.title),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
