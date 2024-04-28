import 'package:coffee_shop/view/screens/main_screen.dart';
import 'package:coffee_shop/view_models/location_data_provider.dart';
import 'package:coffee_shop/view_models/products_data_provider.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart'; //for manually using delegate
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocationDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductsDataProvider(),
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
    final producDataProvider =
        Provider.of<ProductsDataProvider>(context, listen: false);

    return MaterialApp(
      locale: Locale(producDataProvider.locale),

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
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      // title: 'Coffee Shop',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(237, 215, 191, 1),
        primaryColor: const Color.fromRGBO(35, 12, 2, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(237, 215, 191, 1),
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
