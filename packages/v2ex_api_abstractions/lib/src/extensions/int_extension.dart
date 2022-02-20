extension IntExtension on int {
  List<int> fromZero({int step = 1}) {
    return [for (var i = 0; i < this; i += step) i];
  }

  List<int> to(int maxInclusive, {int step = 1}) =>
      [for (int i = this; i <= maxInclusive; i += step) i];
}
