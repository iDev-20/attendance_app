import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial(
      {super.key,
      required this.onTap,
      required this.child,
      this.borderRadius,
      this.inkwellBorderRadius,
      this.elevation,
      this.color});

  final VoidCallback onTap;
  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final BorderRadius? inkwellBorderRadius;
  final double? elevation;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? AppColors.transparent,
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      elevation: elevation ?? 0,
      child: InkWell(
        splashColor: AppColors.defaultColor.withOpacity(0.1),
        borderRadius: inkwellBorderRadius ?? BorderRadius.circular(0),
        onTap: onTap,
        child: child,
      ),
    );
  }
}
