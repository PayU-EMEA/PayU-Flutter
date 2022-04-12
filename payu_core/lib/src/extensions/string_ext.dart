extension StringExt on String {
  /// Removes all characters from the string, leaving only digits.
  /// For ex:
  /// ```
  /// final string = '1234 abcd'.digitsOnly
  /// print(string) // prints: '1234'
  /// ```
  String get digitsOnly {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }
}
