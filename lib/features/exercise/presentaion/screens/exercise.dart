import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/theme/app_fonts.dart';
import 'package:student_project1/features/exercise/presentaion/controllers/exercises_controller.dart';
import 'package:student_project1/features/exercise/presentaion/controllers/get_grade_controller.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/devices_type.dart';
import '../../../../routes/app_routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/image_exercise.dart';
import '../widgets/textformfiled.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExerciseState();
  }

}

class _ExerciseState extends State<Exercise> {

  GlobalKey<FormState> formState = GlobalKey<FormState>();
   late TextEditingController titleController;
    late TextEditingController contentController;

  DateTime? startDate;
  DateTime? endDate;
  final GradeController gradeController = Get.find<GradeController>();
  final ExercisesController exercisesController = Get.find<ExercisesController>();
  int? selectedGrade ;

  @override
  void initState() {
    titleController = TextEditingController();
    contentController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Exercises".tr,
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
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: screenWidth,
                height: screenHeight,
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      var deviceType = getDeviceType(mediaQuery);
                      double localHeight = constraints.maxHeight;
                      double localWidth = constraints.maxWidth;
                      return Form(
                        key: formState,
                        child: ListView(
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "add new Exercise like homework and test.".tr,
                                style: AppTextStyle.bodyRegularLight
                              ),
                              SizedBox(height: 30),
                              ImageExercise(),
                              SizedBox(height: 20,),
                              // Column(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                                  Text(
                                    "Notification Title".tr,
                                    style: AppTextStyle.labelRegularLight,
                                    //textAlign: TextAlign.left,
                                  ),
                                  SizedBox(height: 8,),
                                  CustomTextFormFiled(controller: titleController, hintText: 'the title of notification in bold',),
                              //   ],
                              // ),
                              SizedBox(height: 30,),
                              Text(
                                "Description".tr,
                                style: AppTextStyle.labelRegularLight,
                                //textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 8,),
                              CustomTextFormFiled(controller: contentController, hintText: 'Add some details or context...',maxLines: 5,),
                              SizedBox(height: 30,),

                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 7,
                                  horizontal: localWidth * .02,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                  color: const Color(0xFFFFFFFF),
                                ),
                                child: ListTile(
                                  title: Text(
                                     startDate == null
                                        ? "Select Date Exercise".tr
                                        : "${'Start Date:'.tr} "
                                        '${startDate!.day}/'
                                        '${startDate!.month}/'
                                        '${startDate!.year}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.hintFontLIght
                                        ),
                                  ),
                                  leading: Icon(
                                    Icons.calendar_today,
                                    color: AppColors.bodyFontLight,
                                  ),
                                  onTap: () async {
                                    DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: startDate ?? DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );

                                    if (picked != null) {
                                      setState(() {
                                        startDate = picked;
                                      });
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 30,),
                              //
                              Obx(() {
                                final grades = gradeController.grades;
                                for (var g in grades) {
                                  print("id=${g.id} stage=${g.stageNumber}");
                                }
                                if (grades.isEmpty) {
                                  return const CircularProgressIndicator();
                                }
                                if (!grades.any((g) => g.id == selectedGrade)) {
                                  selectedGrade = null;
                                }
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<int>(
                                      value: selectedGrade,
                                      hint:  Text("Select Grade".tr),
                                      isExpanded: true,
                                      items: grades.map((grade) {
                                        return DropdownMenuItem<int>(
                                          value: grade.id,
                                          child: Text("${'Grade'.tr} ${grade.stageNumber}"),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGrade = value;
                                          print('${'selected grade:'.tr} ${selectedGrade}');
                                        });
                                      },
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(height: 30,),
                              //
                              Row(
                                children: [
                                  Obx(() {
                                    return Expanded(
                                      child: exercisesController.isLoading.value ?
                                          const Center(child: CircularProgressIndicator(),) :
                                      CustomButton(
                                        text: 'Create Exercise'.tr,
                                        colorButton: AppColors.primaryLight,
                                        onTap: () {
                                          exercisesController.createExercise(
                                              title: titleController.text,
                                              content: contentController.text,
                                              date: startDate != null
                                                  ? "${startDate!
                                                  .year}-${startDate!
                                                  .month}-${startDate!.day}"
                                                  : "",
                                              studyStageId: selectedGrade!
                                          );
                                          titleController.clear();
                                          contentController.clear();

                                          setState(() {
                                            startDate = null;
                                            selectedGrade = null;
                                          });
                                        },
                                      ),
                                    );
                                  }
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                      child: CustomButton(
                                        text: 'Create with Notification'.tr,
                                        colorButton: Color(0xFFDDAE09),
                                        onTap: () {
                                          Get.toNamed(Routes.NOTIFICATION);
                                        },
                                      ),
                                    ),

                                ],
                              )
                            ]
                        ),
                      );
                    }
                )
            )
        )
    );
  }

}