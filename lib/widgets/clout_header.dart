import 'package:flutter/material.dart';

import '../models/auth/auth_models.dart';

const _solidFadeTitles = ['Notifications', 'Comments', 'Questions', 'Answers'];

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

    final gradientColors = _solidFadeTitles.contains(title)
        ? [
            offWhite.withValues(alpha: 1.0),
            offWhite.withValues(alpha: 0.8),
            offWhite.withValues(alpha: 0.0),
          ]
        : [
            offWhite.withValues(alpha: 0.5),
            offWhite.withValues(alpha: 0.4),
            offWhite.withValues(alpha: 0.3),
            offWhite.withValues(alpha: 0.2),
            offWhite.withValues(alpha: 0.1),
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
        elevation: 0,
        centerTitle: true,
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
        icon: Icon(action.icon, size: 25),
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
