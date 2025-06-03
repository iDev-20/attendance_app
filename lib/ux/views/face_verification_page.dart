// ignore_for_file: use_build_context_synchronously

import 'package:attendance_app/ux/shared/resources/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:attendance_app/ux/navigation/navigation.dart';
import 'package:attendance_app/ux/views/verification_page.dart';

class FaceVerificationPage extends StatefulWidget {
  const FaceVerificationPage({super.key, this.onExit});

  final void Function()? onExit;

  @override
  State<FaceVerificationPage> createState() => _FaceVerificationPageState();
}

class _FaceVerificationPageState extends State<FaceVerificationPage> {
  CameraController? _cameraController;
  bool _isCameraInitialized = false;
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras.first,
      ),
      ResolutionPreset.medium,
    );
    await _cameraController!.initialize();
    if (mounted) {
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  void _verifyFace() async {
    // Dummy face verification trigger
    await Future.delayed(const Duration(seconds: 2));
    Navigation.navigateToScreenAndClearOnePrevious(
        context: context, screen: const VerificationPage());
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _isCameraInitialized
                ? ClipOval(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CameraPreview(_cameraController!),
                    ),
                  )
                : const CircularProgressIndicator(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30),
              child: InkWell(
                onTap: widget.onExit ??
                    () {
                      Navigation.back(context: context);
                    },
                child: Container(
                  width: 85,
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    children: [
                      Text(
                        'Exit',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.close_sharp,
                        size: 27,
                        color: Colors.black,
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
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50.0),
              child: PrimaryButton(
                onTap: _verifyFace,
                child: const Text('Verify Face'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
