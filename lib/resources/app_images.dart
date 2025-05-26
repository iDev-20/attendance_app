import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  AppImages._();

  //Images
  static AssetImage appLogo = const AssetImage('assets/images/app_logo.png');
  static AssetImage sampleProfilePhoto =
      const AssetImage('assets/images/profile_photo.png');

  //Svgs
  static SvgPicture svgCloseBottomSheetIcon =
      SvgPicture.asset('assets/svgs/close_bottom_sheet_icon.svg');
}
