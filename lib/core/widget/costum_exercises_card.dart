import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ExercisesCard extends StatefulWidget {
  final DateTime date;

  final String title;
  final String grade;
  final String conict;
  final IconData icon;
  final double?width;
  final double?height;

  const ExercisesCard({
    super.key,
    required this.title,
    required this.conict,
    required this.icon,
    required this.grade,
    required this.date,

    this.height,
    this.width,
  });

  @override
  State<ExercisesCard> createState() => _ExercisesCardState();
}
class _ExercisesCardState extends State<ExercisesCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {




    return Card(
      color: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backcardDark
          : AppColors.textFeildLight,
      elevation: 26,
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

                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.secondryDark
                              : AppColors.secondryLight,



                          borderRadius: BorderRadius.circular(10),

                        ),

                        child: Icon(
                          widget.icon,
                          color:  Theme.of(context).brightness == Brightness.dark
                              ? AppColors.backcardDark
                              : AppColors.contonergredLight,
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
                                  ? AppColors.dateDark
                                  : AppColors.blacLight,
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
                                ? AppColors.secondryDark
                                : AppColors.textLight,
                          ),


                        ),
                        const SizedBox(height:10 ,),
                        Text(
                         widget.grade,
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.secondryDark
                                : AppColors.blacLight,
                          ),


                        ),
                        const SizedBox(height:10 ,),
                        Align(
                          alignment:Alignment.bottomLeft ,
                          child: Row(
                            children: [
                              Icon(Icons.schedule),
                              SizedBox(width: 7,),
                              Text(
                                "Date time",
                                style:
                                TextStyle(
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? AppColors.contonergredLight
                                      : AppColors.textLight,
                                ),
                                maxLines: 1,
                                overflow:TextOverflow.ellipsis ,

                              ),
                              SizedBox(width: 7,),
                              Text(
                                "${widget.date.day}/${widget.date.month}/${widget.date.year}",
                                style:
                                TextStyle(
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? AppColors.contonergredLight
                                      : AppColors.textLight,
                                ),
                                maxLines: 1,
                                overflow:TextOverflow.ellipsis ,

                              ),
                            ],
                          ),
                        ),

                      ],
                    )),

              ],
            ),


          ),

        ],
      ),
    );



  }

}
