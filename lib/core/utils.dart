import 'package:intl/intl.dart';

String readableTime(DateTime time) {
  var now = DateTime.now();
  var diff = now.difference(time);
  var seconds = diff.inSeconds;
  var minutes = diff.inMinutes;
  var hours = diff.inHours;
  var days = hours / 24;
  var months = days / 30;
  var years = months / 12;

  if (years > 0) {
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(time);
  }
  if (days > 0) {
    return "$days 天前";
  }

  var remainsMinutes = minutes % 24;
  if (hours > 0) {
    return "$hours 小时 $remainsMinutes 分钟前";
  }

  if (minutes > 0) {
    return "$minutes 分钟前";
  }

  if (seconds > 30) {
    return "$seconds 秒前";
  }

  return "刚刚";
}
