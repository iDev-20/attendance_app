import 'package:attendance_app/ux/shared/components/app_material.dart';
import 'package:attendance_app/ux/shared/components/bottom_sheets.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:attendance_app/ux/shared/resources/app_images.dart';
import 'package:attendance_app/ux/views/profile/choose_photo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/ux/shared/resources/app_page.dart';
import 'package:attendance_app/ux/shared/resources/app_strings.dart';
// import 'package:image_picker/image_picker.dart';

class ViewProfileImagePage extends StatefulWidget {
  const ViewProfileImagePage({super.key});

  @override
  ViewProfileImagePageState createState() => ViewProfileImagePageState();
}

class ViewProfileImagePageState extends State<ViewProfileImagePage> {
  // Future selectNewProfilePhoto() async {
  //   ImageSource? imageSource = await showAppBottomSheet(
  //     context: context,
  //     title: AppStrings.changePicture,
  //     child: const ChoosePhotoBottomSheet(),
  //   );
  //   // if(imageSource != null) {
  //   //   File? newProfileImage = await
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      useSafeArea: false,
      title: AppStrings.profilePicture,
      titleTextColor: AppColors.white,
      leadingIconColor: AppColors.white,
      appBarColor: AppColors.black,
      body: ColoredBox(
        color: AppColors.black,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Image(image: AppImages.sampleProfilePhoto),
                  ),
                ),
                const SizedBox(height: 32),
                AppMaterial(
                  inkwellBorderRadius: BorderRadius.circular(10),
                  onTap: () {
                    showAppBottomSheet(
                        context: context,
                        title: AppStrings.changePicture,
                        showCloseButton: false,
                    child: const ChoosePhotoBottomSheet());
                  },
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.white),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.edit, color: AppColors.white, size: 20),
                        SizedBox(width: 5),
                        Text(
                          AppStrings.changePicture,
                          style: TextStyle(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
