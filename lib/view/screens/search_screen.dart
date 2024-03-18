import 'package:coffee_shop/data/products_data.dart';
import 'package:coffee_shop/models/product_model.dart';
import 'package:coffee_shop/view/widgets/product_list_card.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _allProducts = productsList;
    _filteredProducts = _allProducts;
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -5,
        leadingWidth: 60,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        toolbarHeight: 130,
        title: _buildSearchField(_focusNode),
      ),
      body: GestureDetector(
        onTap: () => _focusNode.unfocus(),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.elliptical(15, 10),
              topRight: Radius.elliptical(15, 10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${_filteredProducts.length} Search results',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _filteredProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ProductListCard(
                            index: index, products: _filteredProducts),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField(FocusNode focusNode) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      width: deviceWidth / 1.30,
      height: 50,
      child: TextField(
        controller: _textEditingController,
        cursorColor: Theme.of(context).primaryColor,
        textInputAction: TextInputAction.search,
        focusNode: focusNode,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                _textEditingController.clear();
                _filterProducts('');
              },
              child: const Icon(
                Icons.clear,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 15,
            ),
            hintText: 'Search your coffee',
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none),
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          _filterProducts(value);
        },
      ),
    );
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _allProducts.where((product) {
        final productName = product.name.toLowerCase();
        return productName.contains(query.toLowerCase());
      }).toList();
    });
  }
}
