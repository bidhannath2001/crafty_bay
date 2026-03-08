
import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  AppBarIconButton({
    super.key,
    required this.icon,
    required this.onTap
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon,color: Colors.grey, size: 18,),
      ),
    );
  }
}