import 'package:coffee_shop/view/screens/cart_screen.dart';
import 'package:coffee_shop/view/screens/favorite_screen.dart';
import 'package:coffee_shop/view/screens/profile_screen.dart';

import 'package:coffee_shop/view/widgets/app_bar_widget.dart';
import 'package:coffee_shop/view/widgets/category_wise_products.dart';
import 'package:coffee_shop/view/widgets/navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  late PageController _pageController = PageController();

  int _currentPageIndex = 0;

  final List<Widget> _pages = [
    const CategoryWiseProducts(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      appBar: AppBarWidget(
        context: context,
        isThereAutomaticallyImplyLeading: false,
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentPageIndex: _currentPageIndex,
        onItemSelection: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(microseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
