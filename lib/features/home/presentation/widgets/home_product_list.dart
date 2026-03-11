import 'package:flutter/material.dart';

import '../../../shared/presentations/widgets/product_cart.dart';

class HomeProductList extends StatelessWidget {
  const HomeProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductCard(),
        separatorBuilder: (context, index) =>
        const SizedBox(width: 4),
        itemCount: 10,
      ),
    );
  }
}
