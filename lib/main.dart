import 'package:coffee_shop/view/screens/main_screen.dart';
import 'package:coffee_shop/view_models/location_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocationDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee Shop',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(237, 215, 191, 1),
          primaryColor: const Color.fromRGBO(35, 12, 2, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(237, 215, 191, 1),
          ),
          useMaterial3: true,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
