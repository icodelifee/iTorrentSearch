String minsToHours(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return "${duration.inHours > 0 ? "${twoDigits(duration.inHours)}h " : ""}${twoDigitMinutes}m";
}
