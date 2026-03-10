import 'package:flutter/material.dart';

import '../../../shared/presentations/widgets/product_cart.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_category_list.dart';
import '../widgets/home_product_list.dart';
import '../widgets/product_search_bar.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(),
              const SizedBox(height: 16),
              HomeCarouselSlider(),
              const SizedBox(height: 16),
              SectionHeader(title: 'Categories', onSeeAll: () {}),
              const SizedBox(height: 16),
              HomeCategoryList(),
              const SizedBox(height: 16),
              SectionHeader(title: 'Popular', onSeeAll: () {}),
              const SizedBox(height: 16),
              HomeProductList(),
              const SizedBox(height: 16),
              SectionHeader(title: 'New', onSeeAll: () {}),
              const SizedBox(height: 16),
              HomeProductList(),
              SectionHeader(title: 'Special', onSeeAll: () {}),
              const SizedBox(height: 16),
              HomeProductList(),
            ],
          ),
        ),
      ),
    );
  }
}




