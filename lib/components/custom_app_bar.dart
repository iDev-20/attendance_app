import 'package:attendance_app/components/app_material.dart';
import 'package:attendance_app/navigation/navigation.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/views/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: AppColors.defaultColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Row(
            children: [
              appBarAction(icon: Icons.notifications, onTap: () {}),
              const SizedBox(width: 10),
              appBarAction(
                icon: Icons.person_rounded,
                onTap: () {
                  Navigation.navigateToScreen(
                      context: context, screen: const ProfilePage());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget appBarAction({required IconData icon, required VoidCallback onTap}) {
    return AppMaterial(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      inkwellBorderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.primaryTeal,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: AppColors.defaultColor,
        ),
      ),
    );
  }
}
