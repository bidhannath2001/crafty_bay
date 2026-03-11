import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/category/presentation/screens/category_list_screen.dart';
import 'package:crafty_bay/features/home/presentation/screens/home_screen.dart';
import 'package:crafty_bay/features/shared/presentations/providers/main_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});
  static const String name = 'main-nav-hoolder';
  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
  final List<Widget> _screen= [
    HomeScreen(),
    CategoryListScreen(),
    SizedBox(),
    SizedBox(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Consumer<MainNavProvider>(
      builder: (context,mainNavProvider,_) {
        return Scaffold(
          body: _screen[mainNavProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.themeColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels:true,
            onTap: mainNavProvider.setIndex,
            currentIndex: mainNavProvider.selectedIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'Categories'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Carts'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),label: 'Wishlist'),
            ],
          ),
        );
      }
    );
  }
}
