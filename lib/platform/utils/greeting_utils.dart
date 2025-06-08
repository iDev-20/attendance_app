import 'package:attendance_app/ux/shared/resources/app_strings.dart';

String getGreetingTitle(String name) {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return '${AppStrings.goodMorning}, $name!';
  } else if (hour < 17) {
    return '${AppStrings.hey} $name!';
  } else {
    return '${AppStrings.evening}, $name!';
  }
}

String getGreetingSubtitle() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return AppStrings.morningGreetingSubtitle;
  } else if (hour < 17) {
    return AppStrings.afternoonGreetingSubtitle;
  } else {
    return AppStrings.eveningGreetingSubtitle;
  }
}
