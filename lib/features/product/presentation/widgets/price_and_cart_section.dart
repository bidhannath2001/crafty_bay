import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';
import '../../../../app/extensions/utils_extension.dart';

class PriceAndCartSection extends StatelessWidget {
  const PriceAndCartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColors.themeColor.withAlpha(30),
      ),
      padding: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${Constants.takaSign}2200',
                  style: context.textTheme.titleMedium!.copyWith(
                    fontSize: 24,
                    color: AppColors.themeColor,
                  ),
                ),
              ],
            ),
            SizedBox(width: 16),
            SizedBox(
              width: 150,
              child: FilledButton(
                onPressed: () {},
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
