import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/job/job_models.dart';
import '../../providers/job/job_notifier.dart';
import '../../widgets/clout_alert.dart';
import '../../widgets/clout_header.dart';
import '../../widgets/clout_toast.dart';

class Questions extends ConsumerStatefulWidget {
  final int id;
  final VoidCallback onNavigateBack;

  const Questions({super.key, required this.id, required this.onNavigateBack});

  @override
  ConsumerState<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends ConsumerState<Questions> {
  final Map<int, TextEditingController> _controllers = {};
  List<QuestionModel>? _initializedFor;

  void _ensureControllers(List<QuestionModel> questions) {
    if (_initializedFor != null) {
      return;
    }
    _initializedFor = questions;
    for (final q in questions) {
      _controllers[q.id] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _showReportDialog() {
    CloutAlert.show(
      context,
      title: 'Report Content',
      body:
          'Let us know what you think should be reported. Our team will review it shortly',
      hasTextField: true,
      onSubmit: (_) {},
    );
  }

  Future<void> _handleSubmit() async {
    final answers = _controllers.map((id, c) => MapEntry(id, c.text.trim()));
    final hasEmpty = answers.values.any((v) => v.isEmpty);

    if (hasEmpty) {
      showToast(
        context,
        message: 'Please answer all questions',
        isSuccess: false,
      );
      return;
    }

    final success = await ref
        .read(jobProvider.notifier)
        .submitApplication(widget.id, answers);

    if (!mounted) return;

    if (success) {
      showToast(context, message: 'Application submitted');
      await Future.delayed(const Duration(milliseconds: 500));
      if (!context.mounted) return;
      widget.onNavigateBack();
    } else {
      final error = ref.read(jobProvider).errorMessage;
      showToast(
        context,
        message: error ?? 'Failed to submit',
        isSuccess: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topInset = MediaQuery.of(context).padding.top;
    final job = ref
        .watch(jobProvider)
        .jobs
        .where((j) => j.id == widget.id)
        .firstOrNull;
    final questions = job?.questions ?? const <QuestionModel>[];

    _ensureControllers(questions);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloutHeader(
        title: 'Questions',
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Go Back',
          onClick: widget.onNavigateBack,
        ),
        actions: [
          HeaderAction(
            icon: Icons.info_outline,
            contentDescription: 'Report',
            onClick: _showReportDialog,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          15,
          kToolbarHeight + topInset + 15,
          15,
          100,
        ),
        children: [
          ...questions.asMap().entries.map((entry) {
            final index = entry.key;
            final question = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${index + 1}. ${question.content}'),
                const SizedBox(height: 8),
                TextField(
                  controller: _controllers[question.id],
                  decoration: InputDecoration(
                    labelText: 'Response',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: theme.colorScheme.outlineVariant.withValues(
                    alpha: 0.4,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          }),
          Center(
            child: FilledButton(
              onPressed: _handleSubmit,
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
