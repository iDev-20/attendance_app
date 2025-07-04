// ignore_for_file: use_build_context_synchronously

import 'package:attendance_app/ux/navigation/navigation_host_page.dart';
import 'package:attendance_app/ux/shared/components/app_dialogs.dart';
import 'package:attendance_app/ux/shared/components/app_material.dart';
import 'package:attendance_app/ux/shared/components/global_functions.dart';
import 'package:attendance_app/ux/shared/resources/app_buttons.dart';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';
import 'package:attendance_app/ux/shared/resources/app_strings.dart';
import 'package:attendance_app/ux/views/onboarding/confirm_courses_page.dart';
import 'package:attendance_app/ux/views/verification_success_page.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:attendance_app/ux/navigation/navigation.dart';

class FaceVerificationPage extends StatefulWidget {
  const FaceVerificationPage({super.key, this.onExit, required this.mode});

  final void Function()? onExit;
  final FaceVerificationMode mode;

  @override
  State<FaceVerificationPage> createState() => _FaceVerificationPageState();
}

class _FaceVerificationPageState extends State<FaceVerificationPage> {
  CameraController? cameraController;
  bool isCameraInitialized = false;
  late List<CameraDescription> cameras;

  bool isVerifying = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras.firstWhere(
        (camera) {
          return camera.lensDirection == CameraLensDirection.front;
        },
        orElse: () {
          return cameras.first;
        },
      ),
      ResolutionPreset.medium,
    );
    await cameraController?.initialize();
    if (mounted) {
      setState(() {
        isCameraInitialized = true;
      });
    }
  }

  void verifyFace() async {
    // Sample face verification logic
    setState(() {
      isVerifying = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    setState(() {
      isVerifying = false;
    });

    switch (widget.mode) {
      case FaceVerificationMode.signUp:
        Navigation.navigateToScreenAndClearOnePrevious(
            context: context, screen: const ConfirmCoursesPage());
        break;

      case FaceVerificationMode.attendance:
        Navigation.navigateToScreenAndClearOnePrevious(
            context: context, screen: const VerificationSuccessPage());
        break;
    }
  }

  Future<void> showCancelDialog() async {
    final result = await showAdaptiveDialog(
        context: context,
        builder: (context) {
          return AppAlertDialog(
            title: AppStrings.cancelVerification,
            desc: AppStrings.areYouSureYouWantToCancelVerification,
            firstOption: 'No',
            secondOption: 'Yes, Cancel',
            onFirstOptionTap: () {
              Navigation.back(context: context, result: false);
            },
            onSecondOptionTap: () {
              Navigation.back(context: context, result: true);
            },
          );
        });
    if (result == true) {
      await cameraController?.dispose();
      cameraController = null;
      if (mounted) {
        Navigation.navigateToScreen(
            context: context, screen: const NavigationHostPage());
      }
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.93;
    final previewSize = cameraController?.value.previewSize;
    return WillPopScope(
      onWillPop: () async {
        await showCancelDialog();
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: (isCameraInitialized && previewSize != null)
                  ? ClipOval(
                      child: SizedBox(
                        height: size,
                        width: size,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            height: previewSize.width,
                            width: previewSize.height,
                            child: CameraPreview(cameraController!),
                          ),
                        ),
                      ),
                    )
                  : const CircularProgressIndicator(),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 30, right: 12),
                child: AppMaterial(
                  inkwellBorderRadius: BorderRadius.circular(10),
                  onTap: widget.onExit ??
                      () {
                        showCancelDialog();
                      },
                  child: Container(
                    width: 85,
                    padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Exit',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.close_sharp,
                          size: 25,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 30, right: 30, bottom: 50.0),
                child: PrimaryButton(
                  onTap: isVerifying ? null : verifyFace,
                  child: isVerifying
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2.5, color: AppColors.white))
                      : Text(widget.mode == FaceVerificationMode.signUp
                          ? AppStrings.registerFace
                          : AppStrings.verifyFace),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
