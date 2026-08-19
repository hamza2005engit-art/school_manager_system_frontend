import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class NotifincationCard extends StatefulWidget {
  final DateTime date;
  final String bottom;
  final String title;
  final String conict;
  final IconData icon;
  final double?width;
  final double?height;

  const NotifincationCard({
    super.key,
    required this.title,
    required this.conict,
    required this.icon,
    required this.date,
    required this.bottom,
    this.height,
    this.width,
  });

  @override
  State<NotifincationCard> createState() => _NotifincationCardState();
}
class _NotifincationCardState extends State<NotifincationCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {




   return Card(
     color: Theme.of(context).brightness == Brightness.dark
         ? AppColors.backcardDark
         : AppColors.textFeildLight,
     elevation: 16,
      shadowColor: Color(0xFF00D4B6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [

                Container(
                  padding:const EdgeInsets.all(12),
                  decoration:BoxDecoration(
                    color:Colors.yellow,
                    borderRadius: BorderRadius.circular(30),

                  ),

                  child: Icon(
                    widget.icon,
                      color: Colors.red,
                    size:30,
                  ),
                ),

                const SizedBox(width: 12,),
                 Expanded(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.primaryDark
                              : AppColors.primaryLight,
                        fontSize: 24

                      ),
                      maxLines: 1,
                      overflow:TextOverflow.ellipsis ,


                    ),
                    const SizedBox(height:4 ,),
                    Text(
                      widget.conict,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.textDark
                            : AppColors.textLight,
                      ),
                      maxLines:isExpanded?null: 1,
                      overflow: isExpanded?TextOverflow.visible: TextOverflow.ellipsis ,

                    ),
                    const SizedBox(height:10 ,),
                    Align(
                      alignment:Alignment.bottomRight ,
                      child: Text(
                        "${widget.date.day}/${widget.date.month}/${widget.date.year}",
                        style:
                        TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.dateDark
                              : AppColors.dateLight,
                        ),
                        maxLines: 1,
                        overflow:TextOverflow.ellipsis ,

                      ),
                    ),

                  ],
                )),

              ],
            ),


          ),
          Positioned(
            top: 8,
            right: 8,
            child:GestureDetector(
            onTap: (){
              setState(() {
                isExpanded=!isExpanded;
              });
            },
            child: Text(
            isExpanded?"view Less" :"view Details",
              style:
              TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.dateDark
                    : AppColors.dateLight,
                fontWeight: FontWeight.bold,
              ),


            ),)
          ),
        ],
      ),
    );



  }

}
