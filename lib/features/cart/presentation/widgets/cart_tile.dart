import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';
import '../../../../app/extensions/utils_extension.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.5,
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
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.themeColor.withAlpha(80),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Icon(Icons.remove,color: Colors.white,),
                              ) ),
                          SizedBox(width: 10,),
                          Text('01',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(width: 10,),
                          Container(
                              decoration: BoxDecoration(
                                  color: AppColors.themeColor,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Icon(Icons.add,color: Colors.white,),
                              ) ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

