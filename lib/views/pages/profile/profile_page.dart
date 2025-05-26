import 'package:attendance_app/components/app_material.dart';
import 'package:attendance_app/components/bottom_sheets.dart';
import 'package:attendance_app/resources/app_buttons.dart';
import 'package:attendance_app/resources/app_colors.dart';
import 'package:attendance_app/resources/app_images.dart';
import 'package:attendance_app/resources/app_strings.dart';
import 'package:attendance_app/views/pages/profile/edit_phone_number_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? newPhoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultColor,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AppImages.sampleProfilePhoto,
              ),
              const SizedBox(height: 16),
              const Text(
                AppStrings.sampleFullName,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                AppStrings.sampleCourse,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 36, vertical: 36),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            profileDetailItem(
                                title: AppStrings.studentIdNumber,
                                value: AppStrings.sampleIdNumber),
                            profileDetailItem(
                                title: AppStrings.studentLevel,
                                value: AppStrings.sampleStudentLevel),
                            profileDetailItem(
                                title: AppStrings.currentSemester,
                                value: AppStrings.sampleCurrentSemester),
                            profileDetailItem(
                                title: AppStrings.schoolEmail,
                                value: AppStrings.sampleSchoolEmail),
                            profileDetailItem(
                                title: AppStrings.nationality,
                                value: AppStrings.sampleNationality),
                            profileDetailItem(
                              title: AppStrings.studentPhoneNumber,
                              value: newPhoneNumber ??
                                  AppStrings.samplePhoneNumber,
                              onTap: () async {
                                final result = await showAppBottomSheet(
                                  context: context,
                                  title: AppStrings.editPhoneNumber,
                                  child: const EditPhoneNumberBottomSheet(),
                                );

                                if (result != null &&
                                    result is String &&
                                    result.isNotEmpty) {
                                  setState(() {
                                    newPhoneNumber = result;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      PrimaryButton(
                          // enabled: phoneNumberController.text.isNotEmpty,
                          // backgroundColor: AppColors.white,
                          // foregroundColor: AppColors.defaultColor,
                          onTap: () {},
                          child: const Text(AppStrings.updateProfile)),
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

  Widget profileDetailItem(
      {required String title, required String value, VoidCallback? onTap}) {
    return AppMaterial(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.transparent,
          border: Border(
            bottom: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              style: const TextStyle(
                  color: AppColors.defaultColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
