import 'package:attendance_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class InformationBanner extends StatelessWidget {
  const InformationBanner({
    super.key,
    this.icon,
    required this.text,
    this.onTap,
    this.visible = true,
  });

  final VoidCallback? onTap;
  final Widget? icon;
  final String text;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: AppColors.primaryTeal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ??
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.defaultColor,
                        size: 20,
                      ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Text(
                      text,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: AppColors.defaultColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
