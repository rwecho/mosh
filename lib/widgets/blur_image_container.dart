import 'dart:ui';
import 'package:flutter/material.dart';

class BlurImageContainer extends StatelessWidget {
  const BlurImageContainer({
    Key? key,
    required this.imageUrl,
    required this.child,
  }) : super(key: key);
  final String imageUrl;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(imageUrl, fit: BoxFit.cover),
        ClipRRect(
          // Clip it cleanly.
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
                color: theme.colorScheme.onPrimary.withOpacity(0.1),
                alignment: Alignment.center,
                child: child),
          ),
        ),
      ],
    );
    ;
  }
}
