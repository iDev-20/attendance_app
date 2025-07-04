import 'package:attendance_app/ux/shared/models/ui_models.dart';
import 'package:flutter/material.dart';

class CourseProvider extends ChangeNotifier {
  List<SemesterCourse> _selectedCourses = [];

  List<SemesterCourse> get selectedCourses => _selectedCourses;

  void setCourses(List<SemesterCourse> courses) {
    _selectedCourses = courses;
    notifyListeners();
  }

  void addCourse(SemesterCourse course) {
    _selectedCourses.add(course);
    notifyListeners();
  }

  void removeCourse(SemesterCourse course) {
    _selectedCourses.remove(course);
    notifyListeners();
  }

  void clearCourses() {
    _selectedCourses.clear();
    notifyListeners();
  }
}
