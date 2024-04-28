import 'package:coffee_shop/data/products_data_de.dart';
import 'package:coffee_shop/data/products_data_en.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductsDataProvider with ChangeNotifier {
  String _locale = 'de';

  String get locale => _locale;

  void setLocale(String locale) {
    _locale = locale;
  }

  // Method to load data based on locale
  List<Product> getProducts() {
    return _locale == "en" ? productsListEnglish : productsListGerman;
  }
}
