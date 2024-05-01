import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectionDialog extends StatefulWidget {
  const SelectionDialog({
    Key? key,
    required this.title,
    required this.options,
    required this.currentSelection,
    required this.onSelectionChanged,
  }) : super(key: key);

  final String title;
  final List<String> options;
  final String currentSelection;
  final Function(String) onSelectionChanged;

  @override
  SelectionDialogState createState() => SelectionDialogState();
}

class SelectionDialogState extends State<SelectionDialog> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.currentSelection;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.options.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedOption,
            onChanged: (value) => setState(() => selectedOption = value!),
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(appLocalizations.cancel_text),
        ),
        TextButton(
          onPressed: () {
            widget.onSelectionChanged(selectedOption);
            Navigator.pop(context);
          },
          child: Text(appLocalizations.select_text),
        ),
      ],
    );
  }
}
