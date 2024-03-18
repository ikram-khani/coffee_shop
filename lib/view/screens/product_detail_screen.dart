import 'package:coffee_shop/view/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        context: context,
        isThereAutomaticallyImplyLeading: true,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text('products details screen'),
        ),
      ),
    );
  }
}
