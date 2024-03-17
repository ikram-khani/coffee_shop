import 'package:coffee_shop/view/screens/cart_screen.dart';
import 'package:coffee_shop/view/screens/favorite_screen.dart';
import 'package:coffee_shop/view/screens/profile_screen.dart';
import 'package:coffee_shop/view/screens/search_screen.dart';
import 'package:coffee_shop/view/widgets/category_wise_products.dart';
import 'package:coffee_shop/view/widgets/navigation_bar.dart';
import 'package:coffee_shop/view/widgets/notification_icon.dart';
import 'package:coffee_shop/view/widgets/popup_menu_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  final FocusNode _searchFocusNode = FocusNode();

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
    _searchFocusNode.dispose();
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
      appBar: AppBar(
        titleSpacing: 20,
        title: Text(
          'IK\'s Coffee Craze',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const NotificationIcon(),
            color: Theme.of(context).primaryColor,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search_outlined),
            color: Theme.of(context).primaryColor,
          ),
          const PopupMenuButtonWidget()
        ],
      ),
      body: GestureDetector(
        onTap: () => _searchFocusNode.unfocus(),
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
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
