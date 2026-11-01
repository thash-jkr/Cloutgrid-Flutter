import 'package:cloutgrid_flutter/models/auth/auth_models.dart';
import 'package:cloutgrid_flutter/widgets/clout_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditRates extends StatefulWidget {
  final String title;
  final Map<String, int?> rates;
  final Future<void> Function(Map<String, int?> rates) onSave;
  final VoidCallback onNavigateBack;

  const EditRates({
    super.key,
    required this.title,
    required this.rates,
    required this.onSave,
    required this.onNavigateBack,
  });

  @override
  State<EditRates> createState() => _EditRatesState();
}

class _EditRatesState extends State<EditRates> {
  late final Map<String, TextEditingController> _controllers;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _controllers = {
      for (final e in widget.rates.entries)
        e.key: TextEditingController(text: e.value?.toString() ?? ''),
    };
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    try {
      final result = {
        for (final e in _controllers.entries)
          e.key: int.tryParse(e.value.text.trim()),
      };
      await widget.onSave(result);
    } finally {
      if (mounted) setState(() => _isSaving = false);
      _controllers.clear();
      widget.onNavigateBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloutHeader(
        title: widget.title,
        icon: HeaderAction(
          icon: Icons.arrow_back,
          contentDescription: 'Back',
          onClick: widget.onNavigateBack,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            spacing: 15,
            children: [
              for (final e in _controllers.entries)
                TextField(
                  controller: e.value,
                  enabled: !_isSaving,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: e.key,
                    prefixText: '₹ ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              FilledButton(
                onPressed: _isSaving ? null : _save,
                child: _isSaving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
