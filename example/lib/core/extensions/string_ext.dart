extension StringExt on String {
  String truncated(int count) {
    return length > count ? '${substring(0, 10)}...' : this;
  }
}
