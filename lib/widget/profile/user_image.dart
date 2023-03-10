import 'package:climbit/widget/loading/loading_wheel.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class UserImage extends StatelessWidget {
  final double? width;
  final String imageUrl;
  const UserImage({super.key, this.width, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
        child: CachedNetworkImage(
        width: width ?? 120,
        height: width ?? 120,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => const LoadingWheel(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      )
    );
  }
}