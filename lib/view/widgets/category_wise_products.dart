import 'package:flutter/material.dart';

class CategoryWiseProducts extends StatefulWidget {
  const CategoryWiseProducts({super.key});

  @override
  State<CategoryWiseProducts> createState() => _CategoryWiseProductsState();
}

class _CategoryWiseProductsState extends State<CategoryWiseProducts> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  ScrollController _scrollController = ScrollController();

  List<String> coffeeCategories = [
    'Espresso',
    'Latte',
    'Cappuccino',
    'Americano',
    'Macchiato',
    'Mocha',
    'Flat White',
    'Affogato',
    'Cold Brew',
    'Iced Coffee',
    'Frappuccino',
    'Decaf',
  ];

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 22,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'What would you like\nto drink today?',
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
                  left: _currentIndex == index ? 22 : 0,
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
            children: [
              // Pages for each category
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text('Category 0 Content'),
                ),
              ),
              Container(
                color: Colors.green,
                child: Center(
                  child: Text('Category 1 Content'),
                ),
              ),
              Container(
                color: Colors.red,
                child: Center(
                  child: Text('Category 2 Content'),
                ),
              ),
              Container(
                color: Colors.yellow,
                child: Center(
                  child: Text('Category 3 Content'),
                ),
              ),
              Container(
                color: Colors.orange,
                child: Center(
                  child: Text('Category 4 Content'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _scrollToCategory(int index) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the width of each category button, assuming a width of 103
    double categoryWidth = 103.0;

    // Calculate the offset to center the selected category
    double offset =
        (index * categoryWidth) - (screenWidth / 2) + (categoryWidth / 2);

    _scrollController.animateTo(
      offset,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
