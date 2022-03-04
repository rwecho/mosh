import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  final String avatarUrl;

  final void Function()? onTap;
  final double? width;
  final double? height;

  const AvatarButton(
      {Key? key,
      required this.avatarUrl,
      required this.onTap,
      this.width = 48,
      this.height = 48})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: width,
            height: height,
            placeholder: (context, url) => CircleAvatar(
                  child: const Icon(Icons.person),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: avatarUrl),
      ),
      onTap: onTap,
    );
  }
}
