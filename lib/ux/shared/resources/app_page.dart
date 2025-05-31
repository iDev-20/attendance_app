import 'package:attendance_app/ux/shared/components/information_banner.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:attendance_app/ux/shared/components/custom_app_bar.dart';
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
  final bool showBackButton;
  final Widget? appBarLeadingIcon;
  final bool showInformationBanner;
  final bool hasRefreshIndicator;
  final bool showDivider;
  final String? informationBannerText;

  const AppPageScaffold(
      {super.key,
      required this.body,
      this.hideAppBar = true,
      this.title,
      this.headerTitle,
      this.headerSubtitle,
      this.actions,
      this.backgroundColor = AppColors.white,
      this.appBarBottom,
      this.floatingActionButton,
      this.bottomNavigationBar,
      this.onBackPressed,
      this.useSafeArea = true,
      this.showBackButton = true,
      this.appBarLeadingIcon,
      this.showInformationBanner = false,
      this.hasRefreshIndicator = false,
      this.showDivider = false,
      this.informationBannerText});

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
                    color: AppColors.defaultColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              automaticallyImplyLeading: false,
              leading: showBackButton
                  ? Container(
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
                            const Icon(Icons.arrow_back,
                                color: AppColors.defaultColor),
                      ),
                    )
                  : null,
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
                    CustomAppBar(
                      title: headerTitle ?? '',
                      subtitle: headerSubtitle ?? '',
                    ),
                  if (showInformationBanner == true)
                    InformationBanner(
                      text: informationBannerText ?? '',
                    ),
                  // else if (hideAppBar == false && showDivider == true)
                  //   const AppDivider(),
                  Expanded(
                    child: hasRefreshIndicator
                        ? RefreshIndicator(onRefresh: () async {}, child: body)
                        : body,
                  ),
                ],
              ),
            )
          : body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
