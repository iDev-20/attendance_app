import 'dart:ui';
import 'package:attendance_app/ux/shared/resources/app_colors.dart';

class Course {
  final String courseCode;
  final String courseTitle;
  final String? status;
  final bool showStatus;

  Course({
    required this.courseCode,
    required this.courseTitle,
    this.status,
    this.showStatus = false,
  });
}

class CourseInfo {
  final String courseCode;
  final String creditHours;
  late final Color color;

  static const List<Color> courseColors = [
    AppColors.boxColor1,
    AppColors.boxColor2,
    AppColors.boxColor3,
    AppColors.boxColor4,
    AppColors.boxColor5,
    AppColors.boxColor6,
    AppColors.boxColor7,
    AppColors.boxColor8,
  ];

  static Color getColorByIndex(int index) {
    // final index = courseCode.hashCode % courseColors.length;
    return courseColors[index % courseColors.length];
  }

  CourseInfo(
      {required this.courseCode, required this.creditHours, required int index})
      : color = CourseInfo.getColorByIndex(index);
}
