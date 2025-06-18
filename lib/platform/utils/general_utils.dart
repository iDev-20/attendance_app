import 'package:flutter/foundation.dart';

class Utils {
  Utils._();
  
  static printInDebugMode(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
