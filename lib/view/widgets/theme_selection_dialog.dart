import 'package:coffee_shop/view/widgets/selection_dialog.dart';
import 'package:coffee_shop/view_models/theme_provider.dart';
import 'package:flutter/material.dart';

class ThemeSelectionDialog extends StatefulWidget {
  final ThemeType currentTheme;
  final Function(ThemeType) onThemeSelection;
  const ThemeSelectionDialog({
    required this.currentTheme,
    super.key,
    required this.onThemeSelection,
  });

  @override
  State<ThemeSelectionDialog> createState() => _GenderSelectionDialogState();
}

class _GenderSelectionDialogState extends State<ThemeSelectionDialog> {
  @override
  Widget build(BuildContext context) {
    return SelectionDialog(
      title: 'Select Theme',
      options: const ['Light', 'Dark'],
      currentSelection:
          widget.currentTheme == ThemeType.dark ? 'Dark' : 'Light',
      onSelectionChanged: (selectedTheme) {
        widget.onThemeSelection(
            selectedTheme == 'Dark' ? ThemeType.dark : ThemeType.light);
      },
    );
  }
}
