import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  const CachedNetworkImageWidget({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fadeInDuration: const Duration(milliseconds: 500),
        placeholderFadeInDuration: const Duration(milliseconds: 300),
        fit: BoxFit.cover,
        placeholder: (context, url) => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: Colors.grey[300],
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[200]!),
              ),
            ),
        imageUrl: imageUrl,
        errorWidget: (context, url, error) {
          return const Center(
            child: Icon(Icons.error),
          );
        });
  }
}
