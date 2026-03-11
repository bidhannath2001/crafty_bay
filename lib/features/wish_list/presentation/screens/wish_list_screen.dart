import 'package:crafty_bay/features/shared/presentations/providers/main_nav_provider.dart';
import 'package:crafty_bay/features/shared/presentations/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,_){
        context.read<MainNavProvider>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: context.read<MainNavProvider>().backToHome,
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          title: Text('Wish List'),
        ),
        body: GridView.builder(
          itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3), itemBuilder: (context,index){
              return FittedBox(child: ProductCard());
        }),
      ),
    );
  }
}
