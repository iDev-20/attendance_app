import 'package:attendance_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key, required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        splashColor: AppColors.defaultColor.withOpacity(0.1),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
