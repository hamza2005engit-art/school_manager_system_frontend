import 'package:flutter/material.dart';

class CustomCircelAvatar extends StatelessWidget {
  const CustomCircelAvatar({super.key, required this.color, required this.icon, this.onPressed});
  final Color color;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: color,
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 18),
        onPressed: onPressed),
    );
  }

}