import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:student_project1/core/theme/app_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 50,width: 50,
              imageUrl: "assets/images/Profile Photo.png",
              fit: BoxFit.cover,
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Image.asset("assets/images/Profile Photo.png",width: 50,height: 50,),
            ),
          ),
          SizedBox(width: 15,),
          Text(
              name,
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 20,fontWeight: AppFonts.headRegularWeight
              ))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}