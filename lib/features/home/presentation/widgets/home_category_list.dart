
import 'package:flutter/cupertino.dart';

import '../../../shared/presentations/widgets/category_card.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryCard(),
        separatorBuilder: (context, index) =>
        const SizedBox(width: 4),
        itemCount: 10,
      ),
    );
  }
}