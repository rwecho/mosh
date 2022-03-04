import 'package:flutter/material.dart';

/// This is just simple SizedBox with a Card with a passed in label, background
/// and text label color. Used to show the colors of a theme color property.
class ThemeCard extends StatelessWidget {
  const ThemeCard({
    Key? key,
    required this.label,
    required this.color,
    required this.textColor,
    this.size = const Size(78, 56),
  }) : super(key: key);

  final String label;
  final Color color;
  final Color textColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: textColor, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
