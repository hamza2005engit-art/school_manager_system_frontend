import 'package:flutter/material.dart';

import '../theme/app_text_style.dart';


class CustomRowProfile extends StatelessWidget {
  const CustomRowProfile({super.key, required this.title, required this.text, required this.icon, this.leadingIcon, this.colorIcon, this.onPressed, this.onTap});
  final String title;
  final String text;
  final IconData icon;
  final IconData? leadingIcon;
  final Color? colorIcon;
  final VoidCallback? onPressed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
   return  InkWell(
     onTap: onTap,
     child: Row(
       children: [
         Icon(icon,size: 30,color: Colors.grey[400],),
         SizedBox(width: 15,),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(
               "${title}",
               style: AppTextStyle.bodyRegularLight,
             ),
             Text(
               "${text}",
               style: AppTextStyle.labelRegularLight,
             )
           ],
         ),
         Spacer(),
         if(leadingIcon == null )
           SizedBox.shrink()
         else
         IconButton(
           onPressed: onPressed,
           icon: Icon(leadingIcon,size: 25,color: colorIcon,)
         )
       ],
     ),
   );
  }

}
