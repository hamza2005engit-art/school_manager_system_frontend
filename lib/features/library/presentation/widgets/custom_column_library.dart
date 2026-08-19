import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/features/library/presentation/widgets/custom_buttom_library.dart';

class CustomColumnLibrary extends StatelessWidget {
  const CustomColumnLibrary({
    super.key,
    required this.localWidth,
    required this.image,
    required this.title,
    required this.url,
  });
  final double localWidth;
  final String image;
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //image book
            ClipOval(
              child: CachedNetworkImage(
                height: 53,
                width: 53,
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/book.png",
                  width: 53,
                  height: 53,
                ),
              ),
            ),
            SizedBox(width: 16),
            //title book
            Text(
              title,
              style: TextStyle(color: Colors.grey),
              //Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(height: 28),
        //2
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBottomLibrary(
              text: 'download'.tr,
              color: Theme.of(context).colorScheme.primary,
              localWidth: localWidth,
              onTap: () {},
            ),
            CustomBottomLibrary(
              text: 'view'.tr,
              color: Theme.of(context).colorScheme.secondary,
              localWidth: localWidth,
            ),
          ],
        ),
      ],
    );
  }
}
