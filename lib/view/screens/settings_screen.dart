import 'package:coffee_shop/view/widgets/language_selection_dialog.dart';
import 'package:coffee_shop/view/widgets/setting_item_tile.dart';
import 'package:coffee_shop/view/widgets/theme_selection_dialog.dart';
import 'package:coffee_shop/view_models/locale_provider.dart';
import 'package:coffee_shop/view_models/location_data_provider.dart';
import 'package:coffee_shop/view_models/theme_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<LocationDataProvider>(context, listen: false)
        .loadLocationEnabledState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    Locale currentLocale = Localizations.localeOf(context);

    double appBarHeight = 70.0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AppBar(
          centerTitle: true,
          title: Text(
            appLocalizations.settings_title_text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          toolbarHeight: 70,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocalizations.general_text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return SettingItemTile(
                    leadingIcon: Icons.light_mode_outlined,
                    title: appLocalizations.theme_text,
                    trailingText:
                        themeProvider.currentThemeType == ThemeType.dark
                            ? 'Dark'
                            : 'Light',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ThemeSelectionDialog(
                            currentTheme:
                                themeProvider.currentThemeType == ThemeType.dark
                                    ? ThemeType.dark
                                    : ThemeType.light,
                            onThemeSelection: (selectedTheme) {
                              themeProvider.setTheme(selectedTheme);
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
              Consumer<LocaleProvider>(
                builder: (context, localeProvider, child) => SettingItemTile(
                  leadingIcon: Icons.translate,
                  title: appLocalizations.language_text,
                  trailingText: localeProvider.locale == 'en'
                      ? appLocalizations.language_value_en
                      : appLocalizations.language_value_de,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LanguageSelectionDialog(
                          currentLocale: Locale(currentLocale.languageCode),
                          onLanguageSelected: (locale) {
                            localeProvider.setLocale(locale.languageCode);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 0, right: 7),
                leading: const Icon(Icons.location_on_outlined),
                title: Text(
                  appLocalizations.location_text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                trailing: Consumer<LocationDataProvider>(
                  builder: (context, provider, child) {
                    bool isLocationEnabled = provider.isLocEnabled;
                    return Switch(
                      value: isLocationEnabled,
                      onChanged: (value) async {
                        if (value) {
                          await provider.requestLocationPermission();
                        } else {
                          await provider.saveLocationEnabledState(false);
                        }
                      },
                      activeColor: Colors.blue,
                      inactiveTrackColor: Colors.grey.withOpacity(0.4),
                      activeTrackColor: Colors.blue,
                      thumbColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                appLocalizations.account_and_security_text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SettingItemTile(
                leadingIcon: Icons.person_4_outlined,
                title: appLocalizations.account_information_text,
                onTap: () {},
              ),
              SettingItemTile(
                leadingIcon: Icons.verified_user_outlined,
                title: appLocalizations.security_and_authentication,
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                appLocalizations.other_text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SettingItemTile(
                leadingIcon: Icons.lock_outline,
                title: appLocalizations.privacy_policy_text,
                onTap: () {},
              ),
              SettingItemTile(
                leadingIcon: Icons.description_outlined,
                title: appLocalizations.terms_and_conditions_text,
                onTap: () {},
              ),
              SettingItemTile(
                leadingIcon: Icons.people_outline_outlined,
                title: appLocalizations.about_us_text,
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 0, right: 7),
                title: Text(
                  appLocalizations.app_version_text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                trailing: const Text('1.0.0'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
