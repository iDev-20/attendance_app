// import 'package:attendance_app/ux/navigation/navigation.dart';
// import 'package:attendance_app/ux/views/profile/view_profile_image_page.dart';
// import 'package:flutter/material.dart';

// class UserProfilePicture extends StatelessWidget {
//   const UserProfilePicture(
//       {super.key, required this.size, this.onTap, this.noPictureWidget});

//   final double size;
//   final VoidCallback? onTap;
//   final Widget? noPictureWidget;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap ??
//           () {
//             Navigation.navigateToScreen(
//               context: context,
//               screen: const ViewProfileImagePage(),
//             );
//           },
//           child: ValueListenableBuilder(valueListenable: valueListenable, builder: (context, value, _) {}),
//     );
//   }
// }
