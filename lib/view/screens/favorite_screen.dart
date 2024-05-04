import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../view_models/locale_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/cart_item_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    List<Product> productsList =
        Provider.of<LocaleProvider>(context).getProducts();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        centerTitle: true,
        title: Text(
          appLocalization.favorite_title_text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CartItemCard(
              category: productsList[index].category,
              title: productsList[index].name,
              price: productsList[index].price.toString(),
              picUrl: productsList[index].pictureUrl,
              productId: productsList[index].id,
              isThisFavoriteScreen: true,
            ),
          );
        },
      ),
    );
  }
}
