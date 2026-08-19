import 'package:flutter/material.dart';

import '../../../../core/widget/custom_circleAvatar.dart';


class CustomCardExercise extends StatelessWidget {
  const CustomCardExercise({super.key, required this.title, required this.content, required this.date});
  final String title;
  final String content;
  final String date;

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
                      Text("Date time ${date}"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(width: 10),
            // تعديل
            // CustomCircelAvatar(color: Theme.of(context).colorScheme.primary, icon: Icons.edit,)
          ],
        ),
      ),
    );
  }

}