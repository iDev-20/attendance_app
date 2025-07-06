import 'package:flutter/material.dart';

class StudentInfoProvider extends ChangeNotifier {
  String _idNumber = '';
  String _level = '';
  String _semester = '';

  String get idNumber => _idNumber;
  String get level => _level;
  String get semester => _semester;

  void setIdNumber(String idNumber) {
    _idNumber = idNumber;
    notifyListeners();
  }

  void setLevel(String level) {
    _level = level;
    notifyListeners();
  }

  void setSemester(String semester) {
    _semester = semester;
    notifyListeners();
  }

  void setStudentInfo(
      {required String idNumber,
      required String level,
      required String semester}) {
    _idNumber = idNumber;
    _level = level;
    _semester = semester;
    notifyListeners();
  }

  void clear() {
    _idNumber = '';
    _level = '';
    _semester = '';
    notifyListeners();
  }
}
