import 'package:crafty_bay/features/product/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentations/widgets/inc_dec_button.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductDetailsScreen.name);
        },
        child: Card(
          color: Colors.white,
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  // color: AppColors.themeColor.withAlpha(30),
                ),
                child: Image.asset(AssetPaths.dummyProduct),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Red White Sneakers',style: context.textTheme.titleLarge,),
                            Text('Color: Red Size: X',style: context.textTheme.bodyMedium,),
                          ],
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline_sharp,size: 30,))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${Constants.takaSign}2200',style: context.textTheme.titleMedium!.copyWith(fontSize: 18, color: AppColors.themeColor),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IncDecButton(
                            onChange: (value){},
                            initialValue: 1,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



