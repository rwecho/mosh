extension DateTimeExtensions on DateTime {
  String humanReadable() {
    final diff = DateTime.now().difference(this);
    if (diff.inYears > 0) {
      return "${diff.inYears}年前";
    }
    if (diff.inMonths > 0) {
      return "${diff.inMonths}月前";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays}天前";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours}小时前";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes}分钟前";
    }
    if (diff.inSeconds > 30) {
      return "${diff.inSeconds}秒前";
    }
    if (diff.inSeconds > 0) {
      return "刚刚";
    }
    return toUtc().toString();
  }
}

extension DurationExtensions on Duration {
  int get inYears => inMicroseconds ~/ (Duration.microsecondsPerDay * 365);

  int get inMonths => inMicroseconds ~/ (Duration.microsecondsPerDay * 30);
}
