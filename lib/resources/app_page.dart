import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/views/pages/home/components/home_header.dart';
import 'package:flutter/material.dart';

typedef OnBackPressed = Function();

class AppPageScaffold extends StatelessWidget {
  final Widget body;
  final bool hideAppBar;
  final String? title;
  final String? headerTitle;
  final String? headerSubtitle;
  final List<Widget>? actions;
  final Color backgroundColor;
  final PreferredSizeWidget? appBarBottom;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final OnBackPressed? onBackPressed;
  final bool useSafeArea;
  final Widget? appBarLeadingIcon;

  const AppPageScaffold({
    super.key,
    required this.body,
    this.hideAppBar = true,
    this.title,
    this.headerTitle,
    this.headerSubtitle,
    this.actions,
    this.backgroundColor = AppColors.defaultColor,
    this.appBarBottom,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.onBackPressed,
    this.useSafeArea = true,
    this.appBarLeadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: hideAppBar
          ? null
          : AppBar(
              backgroundColor: backgroundColor,
              elevation: 0,
              centerTitle: true,
              title: Text(
                title ?? '',
                style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              automaticallyImplyLeading: false,
              leading: Container(
                padding: const EdgeInsets.all(16),
                child: InkResponse(
                  radius: 28,
                  onTap: () {
                    if (onBackPressed != null) {
                      onBackPressed?.call();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: appBarLeadingIcon ??
                      const Icon(Icons.arrow_back, color: AppColors.white),
                ),
              ),
              actions: actions,
              bottom: appBarBottom,
            ),
      body: useSafeArea
          ? SafeArea(
              child: Column(
                children: [
                  if (hideAppBar &&
                      headerTitle != null &&
                      headerSubtitle != null)
                    HomeHeader(
                      title: headerTitle ?? '',
                      subtitle: headerSubtitle ?? '',
                    ),
                  Expanded(child: body),
                ],
              ),
            )
          : body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
