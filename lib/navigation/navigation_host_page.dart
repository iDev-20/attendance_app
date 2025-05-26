import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/views/pages/home_page.dart';
import 'package:attendance_app/views/pages/scan_page.dart';
import 'package:attendance_app/views/pages/verification_success_page.dart';
import 'package:flutter/material.dart';

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
    VerificationSuccessPage()
  ];

  final List<Map<String, dynamic>> bottomNavItems = [
    {'icon': Icons.home, 'text': 'Home'},
    {'icon': Icons.qr_code_scanner, 'text': 'Scan'},
    {'icon': Icons.check_circle, 'text': 'Verification'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomAppBar(
        color: AppColors.transparent,
        shadowColor: AppColors.transparent,
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
