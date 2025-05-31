import 'package:attendance_app/ux/shared/components/app_material.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key, required this.period, required this.hasAction, this.onTap});

  final String period;
  final bool hasAction;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppMaterial(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              period,
              style: const TextStyle(
                color: AppColors.defaultColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (hasAction == true)
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryTeal,
                  shape: BoxShape.circle,
                  // border: Border.all(
                  //   color: AppColors.primaryTeal,
                  // ),
                ),
                child: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: AppColors.defaultColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
