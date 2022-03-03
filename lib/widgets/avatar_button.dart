import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  final String avatarUrl;

  final void Function()? onTap;

  const AvatarButton({
    Key? key,
    required this.avatarUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: 48,
            height: 48,
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
