import 'package:flutter/material.dart';

class CustomButtonSmall extends StatelessWidget {
  final String text;
  final Color colorText;

  const CustomButtonSmall({super.key, required this.text, required this.colorText});
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(9999),
       color: Colors.white,
     ),
     child: Text(
       "${text}",
       style: TextStyle(
         color: colorText,
         fontSize: 16,
         fontWeight: FontWeight.w600,
       ),
     ),
   );
  }

}