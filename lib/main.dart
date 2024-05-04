import 'package:coffee_shop/view/screens/main_screen.dart';
import 'package:coffee_shop/view_models/cart_provider.dart';
import 'package:coffee_shop/view_models/location_data_provider.dart';
import 'package:coffee_shop/view_models/locale_provider.dart';
import 'package:coffee_shop/view_models/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart'; //for manually using delegate
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocaleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeDataProvider = Provider.of<LocaleProvider>(
      context,
    );
    final themeProvider = Provider.of<ThemeProvider>(
      context,
    );

    return MaterialApp(
      theme: themeProvider.currentTheme,
      locale: Locale(localeDataProvider.locale),

      //Manual delegate providing
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en'), // English
      //   Locale('de'), // German
      // ],

      //auto generated delegate providing
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.app_title,
      // title: 'Coffee Shop',

      // ThemeData(
      //   scaffoldBackgroundColor: const Color.fromRGBO(237, 215, 191, 1),
      //   primaryColor: const Color.fromRGBO(35, 12, 2, 1),
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Color.fromRGBO(237, 215, 191, 1),
      //   ),
      //   useMaterial3: true,
      // ),
      home: const MainScreen(),
    );
  }
}
