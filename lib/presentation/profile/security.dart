import 'dart:async';

import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../providers/auth/auth_notifier.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/segmented_list.dart';

class _DeleteConfirmDialog extends StatefulWidget {
  final WidgetRef ref;
  const _DeleteConfirmDialog({required this.ref});

  @override
  State<_DeleteConfirmDialog> createState() => _DeleteConfirmDialogState();
}

class _DeleteConfirmDialogState extends State<_DeleteConfirmDialog> {
  int _countdown = 10;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown <= 1) {
        timer.cancel();
      }
      setState(() => _countdown--);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enabled = _countdown <= 0;

    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Delete Account'),
      content: const Text(
        'Are you sure you want to delete your account? '
        "You will loss all your data! "
        'This action cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: enabled
              ? () {
                  Navigator.pop(context);
                  widget.ref
                      .read(authProvider.notifier)
                      .deleteAccount(
                        widget.ref.read(authProvider).value?.type ?? 'creator',
                      );
                }
              : null, // null disables the button entirely
          child: Text(enabled ? 'Delete' : 'Delete ($_countdown)'),
        ),
      ],
    );
  }
}

class Security extends ConsumerWidget {
  final VoidCallback onNavigateBack;

  const Security({super.key, required this.onNavigateBack});

  void _showDeleteDialog(BuildContext context, WidgetRef ref) {
    showDialog<void>(
      context: context,
      builder: (context) => _DeleteConfirmDialog(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topInset = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'Security',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: onNavigateBack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: kToolbarHeight + topInset + 16,
          left: 16,
          right: 16,
        ),
        child: Column(
          spacing: 1,
          children: [
            // SegmentedListItem(
            //   index: 0,
            //   count: 1,
            //   leading: const Icon(Icons.lock_rounded),
            //   onTap: () {},
            //   title: 'Change Password',
            // ),

            // const SizedBox(height: 25),
            SegmentedListItem(
              index: 0,
              count: 3,
              leading: SvgPicture.asset(
                'assets/icons/instagram.svg',
                width: 25,
                height: 25,
                colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.srcIn,
                ),
              ),
              onTap: () => {
                showToast(
                  context,
                  message: "You haven't connected your Instagram account",
                  isSuccess: false,
                ),
              },
              title: 'Delete Instagram Data',
              danger: true,
            ),

            SegmentedListItem(
              index: 1,
              count: 3,
              leading: SvgPicture.asset(
                'assets/icons/youtube.svg',
                width: 25,
                height: 25,
                colorFilter: const ColorFilter.mode(
                  Colors.red,
                  BlendMode.srcIn,
                ),
              ),
              onTap: () => {
                showToast(
                  context,
                  message: "You haven't connected your YouTube account",
                  isSuccess: false,
                ),
              },
              title: 'Delete YouTube Data',
              danger: true,
            ),

            SegmentedListItem(
              index: 2,
              count: 3,
              leading: const Icon(Icons.delete_rounded, color: Colors.red),
              onTap: () => _showDeleteDialog(context, ref),
              title: 'Delete Account',
              danger: true,
            ),
          ],
        ),
      ),
    );
  }
}
