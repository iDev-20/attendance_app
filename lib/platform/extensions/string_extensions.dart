extension StringExtension on String {
  bool get isBlank {
    return trim().isEmpty;
  }
}

extension NullableStringExtension on String? {
  bool get isNullOrBlank {
    return this?.isBlank ?? true;
  }
}
