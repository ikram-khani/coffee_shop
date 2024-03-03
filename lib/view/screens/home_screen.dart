import 'package:coffee_shop/view/widgets/category_wise_products.dart';
import 'package:coffee_shop/view/widgets/notification_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            onPressed: () {
              if (!_isSearching) {
                setState(() {
                  _isSearching = true;
                });
              }

              _searchFocusNode.requestFocus();
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ),
        title: _isSearching
            ? _buildSearchField(_searchFocusNode)
            : const Text(
                'Good day, Ikram',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const NotificationIcon(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => _searchFocusNode.unfocus(),
        child: const CategoryWiseProducts(),
      ),
    );
  }
}

Widget _buildSearchField(FocusNode focusNode) {
  return TextField(
    textInputAction: TextInputAction.search,
    focusNode: focusNode,
    decoration: const InputDecoration(
      hintText: 'Search...',
      hintStyle: TextStyle(color: Colors.grey),
      border: InputBorder.none,
    ),
    style: const TextStyle(color: Colors.black),
    onChanged: (value) {
      // Handle search functionality
    },
  );
}
