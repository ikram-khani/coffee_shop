import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Language { english, german }

class LanguageSelectionDialog extends StatefulWidget {
  const LanguageSelectionDialog({
    super.key,
    required this.currentLocale,
    required this.onLanguageSelected,
  });
  final Locale currentLocale; // Pass the current locale
  final Function(Locale) onLanguageSelected;

  @override
  State<LanguageSelectionDialog> createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  Language selectedLanguage = Language.english;

  @override
  void initState() {
    super.initState();
    selectedLanguage = widget.currentLocale.languageCode == 'en'
        ? Language.english
        : Language.german;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(appLocalizations.select_text),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<Language>(
            title: Text(appLocalizations.language_value_en),
            value: Language.english,
            groupValue: selectedLanguage,
            onChanged: (value) => setState(() => selectedLanguage = value!),
          ),
          RadioListTile<Language>(
            title: Text(appLocalizations.language_value_de),
            value: Language.german,
            groupValue: selectedLanguage,
            onChanged: (value) => setState(() => selectedLanguage = value!),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'), // Localized cancel button
        ),
        TextButton(
          onPressed: () {
            final newLocale = selectedLanguage == Language.english
                ? const Locale('en')
                : const Locale('de');
            widget.onLanguageSelected(newLocale); // Pass selected locale
            Navigator.pop(context);
          },
          child: Text(
            "Select",
          ), // Localized select button
        ),
      ],
    );
  }
}
