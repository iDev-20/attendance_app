import 'package:attendance_app/components/app_material.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_strings.dart';
import 'package:attendance_app/views/pages/attendance_history_page.dart';
import 'package:attendance_app/views/pages/home_page.dart';
import 'package:attendance_app/views/pages/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavigationHostPage extends StatefulWidget {
  const NavigationHostPage({super.key});

  @override
  State<NavigationHostPage> createState() => _NavigationHostPageState();
}

class _NavigationHostPageState extends State<NavigationHostPage> {
  int currentPageIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ScanPage(),
    AttendanceHistoryPage()
  ];

  final List<Map<String, dynamic>> bottomNavItems = [
    {'icon': Iconsax.home5, 'text': AppStrings.home},
    {'icon': Icons.qr_code_scanner, 'text': 'Scan'},
    {'icon': Iconsax.calendar5, 'text': AppStrings.history},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavItems.length,
            (index) {
              return buildBottomNavIcon(
                icon: bottomNavItems[index]['icon'],
                text: bottomNavItems[index]['text'],
                isSelected: currentPageIndex == index,
                onTap: () => setState(() => currentPageIndex = index),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavIcon(
      {required IconData icon,
      required String text,
      required bool isSelected,
      required VoidCallback onTap}) {
    return AppMaterial(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      inkwellBorderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(16.0),
              )
            : null,
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.defaultColor : AppColors.white,
            ),
            Visibility(
              visible: isSelected,
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: TextStyle(
                        color: isSelected
                            ? AppColors.defaultColor
                            : AppColors.white,
                        fontFamily: 'Nunito',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
