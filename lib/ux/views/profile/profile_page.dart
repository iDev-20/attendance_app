import 'package:attendance_app/ux/shared/components/app_material.dart';
import 'package:attendance_app/ux/shared/components/bottom_sheets.dart';
import 'package:attendance_app/ux/shared/components/global_functions.dart';
import 'package:attendance_app/ux/shared/resources/app_buttons.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:attendance_app/ux/shared/resources/app_images.dart';
import 'package:attendance_app/ux/shared/resources/app_page.dart';
import 'package:attendance_app/ux/shared/resources/app_strings.dart';
import 'package:attendance_app/ux/views/profile/edit_phone_number_bottom_sheet.dart';
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
    return AppPageScaffold(
      hideAppBar: false,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
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
                          color: AppColors.defaultColor,
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
                        padding: const EdgeInsets.only(
                            left: 36, top: 24, right: 36, bottom: 36),
                        decoration: BoxDecoration(
                            color: AppColors.transparent,
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: AppColors.defaultColor)),
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
                                      title: AppStrings.stream,
                                      value: AppStrings.sampleStream),
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
                                        child:
                                            const EditPhoneNumberBottomSheet(),
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
                                // enabled: newPhoneNumber != null,
                                onTap: () {
                                  showAlert(
                                      context: context,
                                      title: 'Success',
                                      desc:
                                          'Phone number updated to $newPhoneNumber',
                                      buttonText: 'Okay');
                                },
                                child: const Text(AppStrings.updateProfile)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
        padding: const EdgeInsets.only(top: 16, bottom: 12),
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
