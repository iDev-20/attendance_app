import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_strings.dart';
import 'package:attendance_app/views/pages/home_page.dart';
import 'package:attendance_app/views/pages/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AttendanceHistoryPage extends StatefulWidget {
  const AttendanceHistoryPage({super.key});

  @override
  State<AttendanceHistoryPage> createState() => _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState extends State<AttendanceHistoryPage> {
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
      backgroundColor: AppColors.defaultColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'View your attendance details',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const Text(
                'Attendance History',
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      // pages[currentPageIndex],
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(32),
                          // boxShadow: const [
                          //   BoxShadow(
                          //     color: Colors.black26,
                          //     blurRadius: 10,
                          //     offset: Offset(0, 4),
                          //   ),
                          // ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            bottomNavItems.length,
                            (index) {
                              return buildBottomNavIcon(
                                icon: bottomNavItems[index]['icon'],
                                text: bottomNavItems[index]['text'],
                                isSelected: currentPageIndex == index,
                                onTap: () =>
                                    setState(() => currentPageIndex = index),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
    return InkWell(
      onTap: onTap,
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
              color: isSelected ? Colors.blueGrey.shade900 : Colors.grey,
            ),
            const SizedBox(width: 8),
            Visibility(
              visible: isSelected,
              child: Text(
                text,
                style: TextStyle(
                    color: isSelected ? Colors.blueGrey.shade900 : Colors.grey,
                    fontFamily: 'Nunito',
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
