import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/utils_extension.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.onSeeAll});
  final String title;
  final VoidCallback onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: context.textTheme.titleLarge),
        Spacer(),
        TextButton(
          onPressed: onSeeAll,
          child: Text('See All', style: TextStyle(color: AppColors.themeColor)),
        ),
      ],
    );
  }
}
