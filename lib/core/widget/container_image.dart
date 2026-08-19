import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ContainerImage extends StatelessWidget {
  const ContainerImage({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 128,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF152765),
          width: 4,
        ),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          height: 112,width: 112,
          imageUrl: imagePath,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Image.asset("assets/images/Profile Photo.png",width: 112,height: 112,),
        ),
      ),
    );
  }

}