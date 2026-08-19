import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/widget/container_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/utils/devices_type.dart';
import '../../../exercise/presentaion/controllers/exercises_controller.dart';
import '../widgets/card_exercise.dart';

class ExercisesForStudent extends StatelessWidget {
  ExercisesForStudent({super.key});

  final student = Get.arguments;
  final ExercisesController exercisesController = Get.find<ExercisesController>();
  final Map<String, dynamic> students = {
     "id": '12345',
     "name": "Omar salem",

   };

   final List<Map<String, String>> data = [
     {
       'title': 'Read page 33 in student book',
       'content': 'lal lalalaal lalallalal lalal lalalal lalal lalalallallalalala lalalala lalalal lalalla.',
       'date':'2/2/2026'
     },
     {
       'title': 'Read page 33 in student book',
       'content': 'lal lalalaal lalallalal lalal lalalal lalal lalalallallalalala lalalala lalalal lalalla.',
       'date':'2/2/2026'
     }
   ];


   @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Exercises For Student".tr,
            style: TextStyle(color: Colors.white,
                fontWeight: AppFonts.labelRegularWeight,
                fontSize: AppFonts.headRegularSize),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon:Icon(Icons.arrow_back,size: 30),),
        ),
        body: SafeArea(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: screenWidth,
                height: screenHeight,
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      var deviceType = getDeviceType(mediaQuery);
                      double localHeight = constraints.maxHeight;
                      double localWidth = constraints.maxWidth;
                      return ListView(
                          children: [
                            SizedBox(height: 16),
                            Column(
                              children: [
                                Text(
                                  "${'ID:'.tr} ${student.studentId}",
                                  style: TextStyle(
                                    color: AppColors.studentDetails,
                                    fontSize: AppFonts.labelRegularSize,
                                    fontWeight: AppFonts.labelRegularWeight
                                  ),
                                ),
                                SizedBox(height: 36,),
                                ContainerImage(imagePath: student.profileImage,),
                                SizedBox(height: 25,),
                                Text(
                                  student.fullName,
                                  style: TextStyle(color: Color(0xFF40484C),fontWeight: AppFonts.labelRegularWeight,fontSize: AppFonts.labelRegularSize),
                                ),
                              ],
                            ),
                      SizedBox(height: 24,),
                            Obx(() {
                              if (exercisesController.isLoading.value) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              if (exercisesController.exercises.isEmpty) {
                                return  Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text("No exercises found for this student".tr),
                                  ),
                                );
                              }

                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: exercisesController.exercises.length,
                                itemBuilder: (context, int index) {
                                  return CustomCardExercise(
                                    title: exercisesController.exercises[index].title,
                                    content: exercisesController.exercises[index].content,
                                    date: exercisesController.exercises[index].date,
                                  );
                                },
                              );
                            }),
                          ],
                      );
                    }
                )
            )
        )
    );
  }

}