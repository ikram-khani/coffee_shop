import 'package:coffee_shop/view/widgets/app_bar_widget.dart';
import 'package:coffee_shop/view/widgets/home_products_listview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);

    List<String> coffeeCategories = locale.languageCode == 'en'
        ? [
            'Espresso',
            'Latte',
            'Black Coffee',
            'Winter Special',
            'Cappuccino',
            'Mocha',
          ]
        : [
            'Espresso',
            'Latte',
            'Schwarzer Kaffee',
            'Winter Spezial',
            'Cappuccino',
            'Mokka',
          ];
    final List<Widget> homeProductsCategoryPages = [
      HomeProductsListView(category: coffeeCategories[0]),
      HomeProductsListView(category: coffeeCategories[1]),
      HomeProductsListView(category: coffeeCategories[2]),
      HomeProductsListView(category: coffeeCategories[3]),
      HomeProductsListView(category: coffeeCategories[4]),
      HomeProductsListView(category: coffeeCategories[5]),
    ];

    return Scaffold(
      appBar: AppBarWidget(
        applocalization: AppLocalizations.of(context)!,
        context: context,
        isThereAutomaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              top: 10,
              bottom: 15,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                appLocalization.home_start_entence,
                textAlign: TextAlign.start,
                style: TextStyle(
                  height: 1,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: coffeeCategories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: _currentIndex == index ? 18 : 0,
                    right: _currentIndex == index ? 20 : 0,
                    bottom: 20,
                    top: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(microseconds: 300),
                        curve: Curves.ease,
                      );
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == index
                            ? Theme.of(context).primaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        coffeeCategories[index],
                        style: TextStyle(
                          color: _currentIndex == index
                              ? Theme.of(context).scaffoldBackgroundColor
                              : Theme.of(context).primaryColor,
                          fontSize: 13,
                          fontWeight: _currentIndex == index
                              ? FontWeight.normal
                              : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  _scrollToCategory(index);
                });
              },
              children: homeProductsCategoryPages,
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToCategory(int index) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the width of each category button, assuming a width of 103
    double categoryWidth = 103.0;

    // Calculate the offset to center the selected category
    double offset =
        (index * categoryWidth) - (screenWidth / 2) + (categoryWidth / 2);

    _scrollController.jumpTo(
      offset,
    );
  }
}
