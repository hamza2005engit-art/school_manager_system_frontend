
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/core/theme/app_fonts.dart';
import 'package:student_project1/features/exercise/presentaion/controllers/exercises_controller.dart';
import 'package:student_project1/features/exercise/presentaion/screens/exercise.dart';
import 'package:student_project1/routes/app_routes.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/devices_type.dart';
import '../widgets/card_exercise.dart';

class AllExercise extends StatelessWidget {
   AllExercise({super.key});
   final ExercisesController exercisesController = Get.find<ExercisesController>();
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
   final role = (GetStorage().read('role') ?? '').toString();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Exercises".tr,
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
      floatingActionButton: role=='teacher'? FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADDEXERCISE);
        },
        backgroundColor: AppColors.primaryLight,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ): null,
        body: SafeArea(
            child: Obx(() {
              return exercisesController.isLoading.value ?
                  Center(child: CircularProgressIndicator(),)
              :  Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: screenWidth,
                  height: screenHeight,
                  child: LayoutBuilder(
                      builder: (BuildContext context,
                          BoxConstraints constraints) {
                        var deviceType = getDeviceType(mediaQuery);
                        double localHeight = constraints.maxHeight;
                        double localWidth = constraints.maxWidth;
                        return ListView.builder(
                          itemCount: role == 'student'
                              ? exercisesController.exercisesForStudent.length
                              : exercisesController.exercises.length,

                          itemBuilder: (context, int index) {
                            if (role == 'student') {
                              if (exercisesController.exercisesForStudent.isEmpty) return SizedBox.shrink();

                              final studentExercise = exercisesController.exercisesForStudent[index];
                              return CardExercise(
                                title: studentExercise.title,
                                content: studentExercise.content,
                                date: studentExercise.date,
                                id: studentExercise.id!,
                              );
                            } else {
                              if (exercisesController.exercises.isEmpty) return SizedBox.shrink();

                              final teacherExercise = exercisesController.exercises[index];
                              return CardExercise(
                                title: teacherExercise.title,
                                content: teacherExercise.content,
                                date: teacherExercise.date,
                                id: teacherExercise.id!,
                              );
                            }
                          },
                        );
                      }
                  )
              );
            }
            )
        )
    );
  }

}