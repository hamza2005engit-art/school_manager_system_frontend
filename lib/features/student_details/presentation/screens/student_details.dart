import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/widget/container_image.dart';
import 'package:student_project1/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/utils/devices_type.dart';
import '../../../../core/widget/custom_profile_into_card.dart';
import '../../../../core/widget/row_card_profie.dart';
import '../../../exercise/presentaion/widgets/custom_button.dart';
import '../../../exercises _for_student/presentation/screens/exercises _for_student.dart';
import '../controllers/update_mark_controller.dart';
import '../widgets/textFieldMark.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({super.key,});

  final student = Get.arguments;
  final UpdateMarkController updateMarkController = Get.find<UpdateMarkController>();

  final Map<String, dynamic> students = {
    "id": '12345',
    "name": "Omar salem",
    'Rate': '98',
    'final': 'none',
    'test': '88',
    'exercis': 'non',
    'location': 'Damascus',
    'age': '18',
    'phone': '0936240503',
    'email': 'email@gmail.com',
  };

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    if (student == null) {
      return  Scaffold(body: Center(child: Text("No student data provided".tr)));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Details".tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: AppFonts.labelRegularWeight,
            fontSize: AppFonts.headRegularSize,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, size: 30),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          width: screenWidth,
          height: screenHeight,
          child: GetBuilder<UpdateMarkController>(

            builder: (UpdateMarkController controller) {
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var deviceType = getDeviceType(mediaQuery);
                  double localHeight = constraints.maxHeight;
                  double localWidth = constraints.maxWidth;
                  return ListView(
                    children: [
                      SizedBox(height: 20),
                      Column(
                        children: [
                          Text(
                            "${'ID:'.tr} ${student.studentId}",
                            style: TextStyle(
                              color: AppColors.studentDetails,
                              fontSize: AppFonts.labelRegularSize,
                              fontWeight: AppFonts.labelRegularWeight,
                            ),
                          ),
                          SizedBox(height: 36),
                          ContainerImage(
                            imagePath: student.profileImage,
                          ),
                          SizedBox(height: 25),
                          Text(
                            student.fullName,
                            style: TextStyle(
                              color: Color(0xFF40484C),
                              fontWeight: AppFonts.labelRegularWeight,
                              fontSize: AppFonts.labelRegularSize,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      //
                      Container(
                        padding: EdgeInsets.only(
                          left: localWidth * .05,
                          top: 10,
                          bottom: 10,
                        ),
                        height: 122,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.symmetric(
                            horizontal: BorderSide(
                                width: 2, color: Colors.white),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.library_books,
                              size: 20,
                              color: AppColors.secondryLight,
                            ),
                            Text(
                              "MARK".tr,
                              style: TextStyle(
                                fontWeight: AppFonts.labelRegularWeight,
                                fontSize: AppFonts.labelRegularSize,
                                color: Color(0xFF43474F),
                              ),
                            ),
                            Text(
                              "${students['Rate']} %",
                              style: TextStyle(
                                color: Color(0xFF181C1E),
                                fontSize: AppFonts.headRegularSize,
                                fontWeight: AppFonts.headRegularWeight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Mark Details".tr,
                        style: TextStyle(
                          fontWeight: AppFonts.headRegularWeight,
                          fontSize: AppFonts.headRegularSize,
                          color: Color(0xFF181C1E),
                        ),
                      ),
                      SizedBox(height: 16),
                      ProfileInfoCard(
                        cardProfile: [
                          CustomRowProfile(
                            title: 'Final'.tr,
                            text: '${student.finalMark}' ?? 'non',
                            icon: Icons.school_outlined,
                            leadingIcon: Icons.edit,
                            colorIcon: AppColors.primaryLight,
                            onPressed: () {
                              updateMarkController.changeSelectedType('final');
                              print('final ${student.id}');
                              showModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                enableDrag: true,
                                builder: (context) {
                                  return TextFiledMark(
                                      localWidth: localWidth,
                                      text: "Enter the final grade for the student".tr,
                                      studentId: student.id.toString(),
                                      materialId: student.materialId.toString()
                                  );
                                },
                              );
                            },
                          ),
                          //2
                          CustomRowProfile(
                            title: 'Test'.tr,
                            text: '${student.testMark}/100' ?? 'non',
                            icon: Icons.school_outlined,
                            leadingIcon: Icons.edit,
                            colorIcon: AppColors.primaryLight,
                            onPressed: () {
                              updateMarkController.changeSelectedType('test');
                              showModalBottomSheet(
                                context: context,
                                isDismissible: true,
                                enableDrag: true,
                                builder: (context) {
                                  return TextFiledMark(
                                    localWidth: localWidth,
                                    text: "Enter the test grade for the student".tr,
                                    studentId: student.id.toString(),
                                    materialId: student.materialId.toString(),
                                  );
                                },
                              );
                            },
                          ),
                          //3
                          CustomRowProfile(
                            title: 'Exercis'.tr,
                            text: '',
                            icon: Icons.school_outlined,
                            leadingIcon: Icons.arrow_forward,
                            colorIcon: AppColors.primaryLight,
                            onPressed: () {
                              Get.toNamed(Routes.EXERCISEFORSTUDENT,
                                  arguments: student
                              );
                            },
                          ),
                        ],
                      ),
                      //
                      Text(
                        "Personal Details".tr,
                        style: TextStyle(
                          fontWeight: AppFonts.headRegularWeight,
                          fontSize: AppFonts.headRegularSize,
                          color: Color(0xFF181C1E),
                        ),
                      ),
                      SizedBox(height: 16),
                      ProfileInfoCard(
                        cardProfile: [
                          CustomRowProfile(
                            title: 'School'.tr,
                            text: 'Al-Saada School'.tr,
                            icon: Icons.school,
                          ),
                          //2
                          CustomRowProfile(
                            title: 'Location'.tr,
                            text: '${student.location}',
                            icon: Icons.location_on,
                          ),
                          //3
                          CustomRowProfile(
                            title: 'Phone'.tr,
                            text: '${student.phone}',
                            icon: Icons.location_on,
                          ),
                          CustomRowProfile(
                            title: 'Email'.tr,
                            text: '${student.email}',
                            icon: Icons.email,
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        alignment: Alignment.topLeft,
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: localWidth *
                            .23),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.NOTIFICATION);
                          },
                          child: CustomButton(
                            text: 'Add Notification'.tr,
                            colorButton: Color(0xFFFFDB5E),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                },
              );
            }
          ),
        ),
      ),
    );
  }
}
