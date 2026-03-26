import 'package:crafty_bay/features/product/presentation/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/presentation/widgets/price_and_cart_section.dart';
import 'package:crafty_bay/features/product/presentation/widgets/product_image_carousel.dart';
import 'package:crafty_bay/features/product/presentation/widgets/size_picker.dart';
import 'package:crafty_bay/features/shared/presentations/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/utils_extension.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product_details-screen';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Red White Sneakers',
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            IncDecButton(onChange: (int value) {}),
                          ],
                        ),
                        Row(
                          spacing: 8,
                          children: [
                            Wrap(
                              children: [
                                Icon(Icons.star, size: 16, color: Colors.amber),
                                Text(
                                  '4.5',
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Reviews',
                                style: TextStyle(color: AppColors.themeColor),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColors.themeColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.favorite_outline,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ColorPicker(
                          initialColor: 'RED',
                          onSelected: (String color) {},
                          colors: ['RED', 'GREEN', 'BLACK'],
                        ),
                        const SizedBox(height: 16),
                        SizePicker(
                          onSelected: (String size) {},
                          initialSize: 'M',
                          sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                        ),
                        const SizedBox(height: 16),
                        Text('Description', style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.''',
                            textAlign: TextAlign.justify,
                            style:TextStyle(
                              color: Colors.black54,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          PriceAndCartSection(),
        ],
      ),
    );
  }
}
