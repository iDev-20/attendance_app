import 'package:attendance_app/resources/app_strings.dart';

String getGreetingTitle(String name) {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good morning, $name!';
  } else if (hour < 17) {
    return 'Hey $name!';
  } else {
    return 'Evening, $name!';
  }
}

String getGreetingSubtitle() {
  final hour = DateTime.now().hour;

  if (hour < 16) {
    return AppStrings.morningGreetingSubtitle;
  } else if (hour < 17) {
    return AppStrings.afternoonGreetingSubtitle;
  } else {
    return AppStrings.eveningGreetingSubtitle;
  }
}
