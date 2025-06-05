import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImages {
  AppImages._();

  //Images
  static AssetImage appLogo =
      const AssetImage('assets/images/attendance_app_logo.png');
  static AssetImage backgroundImage =
      const AssetImage('assets/images/background_image.png');
  static AssetImage sampleProfilePhoto =
      const AssetImage('assets/images/profile_photo.png');
  static AssetImage successLogo =
      const AssetImage('assets/images/success_logo.png');

  //Svgs
  static SvgPicture svgCloseBottomSheetIcon =
      SvgPicture.asset('assets/svgs/close_bottom_sheet_icon.svg');
  static SvgPicture svgChatIcon = SvgPicture.asset('assets/svgs/chat_icon.svg');
  static SvgPicture svgChatIcon2 = SvgPicture.asset('assets/svgs/chat_icon_2.svg');
}
