import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/presentations/providers/main_nav_provider.dart';
import '../widgets/bottom_nav_of_cart.dart';
import '../widgets/cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        context.read<MainNavProvider>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: context.read<MainNavProvider>().backToHome,
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          title: Text('Cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CartTile(),
                CartTile(),
                CartTile(),
                CartTile(),
                CartTile(),
                CartTile(),
                CartTile(),
                CartTile(),
                CartTile(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavOfCart(),
      ),
    );
  }
}

