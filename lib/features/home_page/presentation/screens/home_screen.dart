import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/core/theme/app_colors.dart';
import 'package:student_project1/core/theme/app_fonts.dart';
import 'package:student_project1/core/utils/devices_type.dart';
import 'package:student_project1/core/widget/CustomappBar.dart';
import 'package:student_project1/core/widget/customBottomNavigatorBar.dart';
import 'package:student_project1/core/widget/custom_card_announcements.dart';
import 'package:student_project1/core/widget/custom_container_4card.dart';
import 'package:student_project1/features/home_page/presentation/controllers/statisctics_controller.dart';
import 'package:student_project1/features/home_page/presentation/controllers/attendance_controller.dart';
import 'package:student_project1/features/profile/presentation/screens/profile.dart';
import 'package:student_project1/features/schedule/presentation/screens/schedule.dart';
import 'package:student_project1/features/home_page/presentation/widgets/custom_function_role.dart';
import 'package:student_project1/features/home_page/presentation/widgets/custom_function_role_student_teacher.dart';
import 'package:student_project1/features/home/presentation/screens/marks_student_screen.dart';
import 'package:student_project1/routes/app_routes.dart';

import '../controllers/average_controller.dart';


class HomeScreenMain extends StatelessWidget {
   HomeScreenMain({super.key});

   final role = (GetStorage().read('role') ?? '').toString();
   final name = GetStorage().read('name') ?? '';
   final storage = GetStorage();
   final String salary = (GetStorage().read('salary') ?? '0').toString();  final List grade = jsonDecode(GetStorage().read('grade') ?? '[]');

  final List section = jsonDecode(GetStorage().read('section') ?? '[]');
  final StatiscticsController statiscticsController = Get.find<StatiscticsController>();
  late int numStudents = statiscticsController.countStudents.value;
  late int numTeachers = statiscticsController.countTeachers.value;
  final AttendanceController attendanceController = Get.find<AttendanceController>();
  final AverageController averageController = Get.find<AverageController>();

  final Map<String, dynamic> data = const {
    //اسم الطالب
    'name': 'Ali',
    //عدد الحصص
    'numberOfServings': 'three',
    //'durationOfTheSession': '9:45 AM - 10:30 AM',
    //'grade': '10',
    //'section': '2',
    'advertisement': 'do not late being at school before 8:00',
    'salary': '3000',
  };
  final Map<String, dynamic> roleData = const {
    'student': {
      // 'grade': '10',
      'section': '2',
      'durationOfTheSession': '9:45 AM - 10:30 AM',
      'nameTeacher': 'Mr. Smith',
    },
    'teacher': {
      'grade': '10',
      'section': '2',
      'durationOfTheSession': '9:45 AM - 10:30 AM',
    },
    'admin': {'numTeachers': '28', 'numStudents': '214'},
  };

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    print('role ${role}');

    // String displaySalary = "0";
    // if (salary.isNotEmpty) {
    //   print('salary${salary}');
    //   String displaySalary = salary != '0' ? salary : "2000";    }

    String displaySection = "N/A";
    if (section.isNotEmpty) {
      displaySection = section[0]['section_number']?.toString() ?? "N/A";
    }

    String displayGrade = "N/A";
    if (grade.isNotEmpty) {
      displayGrade = grade[0]?.toString() ?? "N/A";
      print('grade $displayGrade');
    }

    return Scaffold(
      drawer: Drawer(),
      appBar: CustomAppBar(name: name,),
        bottomNavigationBar: CustomBottomNavigator(
          currentIndex: role == 'admin' ? 1 : 2,
            onTap: (index) {
              if(role == 'student' || role == 'teacher') {
                if (index == 0) {
                  if(role=='teacher') {
                    Get.toNamed(Routes.STUDENTSFORTEACHER);
                  } else {
                  Get.offNamed(Routes.MARKS);}
                }
                if (index == 1) {
                  Get.offNamed(Routes.SCHEDULE);
                }
                if(index == 3) {
                  Get.toNamed(Routes.TASK);
                }
                if (index == 4) {
                  Get.offNamed(Routes.PROFILE);
                }
              } else {
                if(index == 0) {
                  Get.offNamed(Routes.StudentManagmetAdmin);
                }
                if(index == 2) {
                  Get.toNamed(Routes.TASK);
                }
                if(index == 3)  {
                  Get.toNamed(Routes.PROFILE);
                }
              }
            },
          bottomNavigatorBarItem: [
            BottomNavigationBarItem(
              icon: Icon(
                role == 'teacher' || role == 'admin' ?
                  Icons.groups: Icons.assignment_turned_in),
              label: role == 'teacher' || role == 'admin' ?'Students' : 'Marks',
            ),
            if(role == 'student' || role == 'teacher')
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Schedule',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.task),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
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
                  SizedBox(height: 20),
                  Text(
                    "${'Welcome back,'.tr}\n${name}",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: AppFonts.fontName,
                      fontSize: AppFonts.headLargeSize,
                      fontWeight: AppFonts.headLargeWeight,
                    ),
                  ),
                  SizedBox(height: 10),
                  if (role != 'admin')
                    Text(
                      "${'You have three classes today.'.tr}\n${'Lets make this a productive day.'.tr}",
                      style:
                         Theme.of(context).textTheme.bodyMedium,
                    ),
                  SizedBox(height: 20),
                  Obx(() => buildRoleSection(
                    role: role,
                    section: displaySection,
                    grade: displayGrade,
                    numStudent: statiscticsController.countStudents.value,
                    numTeacher: statiscticsController.countTeachers.value,
                    attendanceList: attendanceController.attendanceRates.value,
                  )),
                  // CustomContainerWorkSchedule(
                  //   grade: data['grade'],
                  //   section: data['section'],
                  //   durationOfTheSession: data['durationOfTheSession'],
                  // ),
                  SizedBox(height: 20),

                  CustomCardAnnouncements(advertisement: data['advertisement']),

                  SizedBox(height: 20),
                  Obx(() {
                    double studentAverage = 0.0;

                    if (averageController.averageStudentList.isNotEmpty) {
                      studentAverage = (averageController.averageStudentList[0].average ?? 0).toDouble();
                    }

                    return buildRoleSectionStudentAndTeachere(
                      role: role,
                      salary: salary,
                      average: studentAverage,
                    );
                  }),                 // CustomContainerSalary(salary: data['salary']),
                  SizedBox(height: 30),
                  CustomContainer4Card(localWidth: localWidth, role: role,),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
