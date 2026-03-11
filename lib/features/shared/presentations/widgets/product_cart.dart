import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        elevation: 2,
        shadowColor: AppColors.themeColor.withAlpha(30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                color: AppColors.themeColor.withAlpha(30),
              ),
              child: Image.asset(AssetPaths.dummyProduct),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Red White Sneakers',maxLines: 1,style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),),
                  Row(
                    spacing: 4,
                    children: [
                      Text('${Constants.takaSign}2500'),
                      Wrap(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Text('4.5', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.favorite_outline, size: 16, color: Colors.white),
                      )
                    ],

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}