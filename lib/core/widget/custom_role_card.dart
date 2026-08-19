import 'package:flutter/material.dart';

class RoleCard extends StatelessWidget{
  final String title;
  final IconData? icon;
  final bool isSelected;
   final VoidCallback onTap;
   final double?width;
   final double?height;
   final Color?selectColor;

  const RoleCard({
    super.key,
  required this.title,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.height,
    this.width,
    this.selectColor,




  });
  @override
Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: width ?? MediaQuery.of(context).size.width * 0.25,
          height: height ?? MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color:isSelected?(selectColor??
              Theme.of(context).primaryColor).withOpacity(0.1)
              :Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color:isSelected?(selectColor??
                Theme.of(context).primaryColor)
                :Colors.grey.shade300,
            width:isSelected?2: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0,4),
            )
          ],

        ),
child:Center(
  child: Text(
    title,
    style:  TextStyle(
      fontSize: 14,
      fontWeight: isSelected ?FontWeight.bold: FontWeight.normal,
      color:isSelected?(selectColor??
    Theme.of(context).primaryColor)
      :Colors.black,
    ),
  ),
)
      ),

    );
  }
}