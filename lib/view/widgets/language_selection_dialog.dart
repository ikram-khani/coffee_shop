import 'package:coffee_shop/view/widgets/selection_dialog.dart';
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
    return SelectionDialog(
      title: appLocalizations.language_alert_title,
      //options[English, German]
      options: [
        appLocalizations.language_value_en,
        appLocalizations.language_value_de
      ],
      //if selected language from the current locale is english then English is current selection else German
      currentSelection: selectedLanguage == Language.english
          ? appLocalizations.language_value_en
          : appLocalizations.language_value_de,
      onSelectionChanged: (selectedOption) {
        final newLocale = selectedOption == appLocalizations.language_value_en
            ? const Locale('en')
            : const Locale('de');
        widget.onLanguageSelected(newLocale);
      },
    );
  }
}
