import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/features/exercise/presentaion/controllers/exercises_controller.dart';

import '../../../../core/widget/custom_circleAvatar.dart';

class CardExercise extends StatelessWidget {
   CardExercise({super.key, required this.title, required this.content, required this.date, required this.id});
  final String title;
  final String content;
  final String date;
  final int id;
  final ExercisesController exercisesController = Get.find<ExercisesController>();
   final role = (GetStorage().read('role') ?? '').toString();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.library_books, color: Color(0xFF007F6D)),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "${title}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Text("${content}"),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.access_time, size: 12, color: Colors.red),
                      SizedBox(width: 5),
                      Text("${'Date time'.tr} ${date}"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: 10),

            // الأزرار الجانبية
            if(role=='teacher'||role=='admin')
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // تعديل
                // CustomCircelAvatar(color: Theme.of(context).colorScheme.primary, icon: Icons.edit,),

                SizedBox(height: 10),
                // حذف
                CustomCircelAvatar(color: Colors.red, icon: Icons.delete,onPressed: () {
                  exercisesController.deleteExercise(id);
                },),
              ],
            ),
          ],
        ),
      ),
    );
  }

}