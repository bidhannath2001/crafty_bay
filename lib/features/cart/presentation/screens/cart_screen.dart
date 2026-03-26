import 'package:crafty_bay/features/cart/presentation/widgets/total_price_and_checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../shared/presentations/providers/main_nav_provider.dart';
import '../widgets/cart_tile.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:(_,_){
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
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CartTile(),
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: 10,
              ),
            ),
            TotalPriceAndCheckout(),
          ],
        ),
        // bottomNavigationBar: BottomNavOfCart(),
      ),
    );
  }
}


