import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/utils_extension.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          child: Padding(
            padding: const .all(16.0),
            child: Icon(Icons.laptop,size: 50,color: AppColors.themeColor,),
          ),
        ),
        Text('Electronics',style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: AppColors.themeColor),),
      ],
    );
  }
}