import 'package:attendance_app/ux/shared/models/ui_models.dart';
import 'package:flutter/material.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> _selectedCourses = [];

  List<Course> get selectedCourses => _selectedCourses;

  void setCourses(List<Course> courses) {
    _selectedCourses = courses;
    notifyListeners();
  }

  void addCourse(Course course) {
    _selectedCourses.add(course);
    notifyListeners();
  }

  void removeCourse(Course course) {
    _selectedCourses.remove(course);
    notifyListeners();
  }

  void clearCourses() {
    _selectedCourses.clear();
    notifyListeners();
  }
}
