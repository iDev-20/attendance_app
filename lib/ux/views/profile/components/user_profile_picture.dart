// import 'package:attendance_app/ux/navigation/navigation.dart';
// import 'package:attendance_app/ux/shared/components/app_image_widgets.dart';
// import 'package:attendance_app/ux/shared/resources/app_images.dart';
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
//       child: ValueListenableBuilder(
//         valueListenable: valueListenable,
//         builder: (context, value, _) {
//           if (value?.user == null ||
//               (value?.user.hasProfilePicture() ?? false) == false) {
//             return noPictureWidget ??
//                 AppImageWidget.local(
//                   image: AppImages.defaultProfileImageTeal,
//                   height: size,
//                   width: size,
//                 );
//           }
//           return AppImageWidget(
//             imageUrl: 'imageUrl',
//             height: size,
//             width: size,
//             borderRadius: 100,
//           );
//         },
//       ),
//     );
//   }
// }
