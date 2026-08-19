import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:student_project1/core/widget/CustomappBar.dart';
import 'package:student_project1/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/widget/customBottomNavigatorBar.dart';
import '../../../home_page//presentation/screens/home_screen.dart';
import '../../../profile/presentation/screens/profile.dart';
import '../controllers/schedule_controller.dart';

class Schedule extends StatefulWidget {
  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  // 1. تعريف اليوم المختار (افتراضياً الاثنين)
  String selectedDay = 'Saturday';
  final role = (GetStorage().read('role') ?? '').toString();

  // القائمة الكاملة للأيام لربط الـ Index بالاسم
  final List<String> days = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  final Map<String, List<Map<String, dynamic>>> weeklySchedule = {
    'Monday': [
      {'title': 'Math', 'text': '08:00 AM', 'grade': '10', 'section': '2'},
      {'title': 'Arabic', 'text': '09:00 AM', 'grade': '10', 'section': '2'},
      {'title': 'English', 'text': '10:00 AM', 'grade': '10', 'section': '2'},
    ],
    'Tuesday': [
      {'title': 'Physics', 'text': '08:00 AM', 'grade': '10', 'section': '2'},
      {'title': 'Chemistry', 'text': '09:30 AM', 'grade': '10', 'section': '2'},
    ],
  };

  final ScheduleController scheduleController = Get.find<ScheduleController>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final now = DateTime.now();
    String name = GetStorage().read('name');
    final day = DateFormat('EEEE').format(DateTime.now()).toLowerCase();



    return Scaffold(
      drawer: Drawer(),
      appBar: CustomAppBar(name: name,),
      bottomNavigationBar: CustomBottomNavigator(
          currentIndex: 1 ,
          onTap: (index) {
            if(index == 0) {
              if(role == 'teacher') {
                Get.offNamed(Routes.STUDENTSFORTEACHER);
              } else {
                Get.offNamed(Routes.MARKS);
              }
            }
            if(index == 4) {
              Get.offNamed(Routes.PROFILE);
            }
            if(index == 2) {
              Get.offNamed(Routes.Home1);
            }
            if(index == 3) {
              Get.toNamed(Routes.TASK);
            }

          },
        bottomNavigatorBarItem: [
          BottomNavigationBarItem(
            icon: Icon(
                role == 'teacher' ?
                Icons.groups: Icons.assignment_turned_in),
            label: role == 'teacher' ?'Students' : 'Marks',
          ),
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
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(() {

            final schedule = scheduleController.schedule.value;
            if(schedule == null) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView(
              children: [
                const SizedBox(height: 20),
                Text(
                  "${now.day} / ${now.month} / ${now.year}  $day",
                  style: AppTextStyle.bodyLargeLight,
                ),
                const SizedBox(height: 30),

                // --- قائمة الأيام الأفقي ---
                // SizedBox(
                //   height: 80,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: days.length,
                //     itemBuilder: (context, index) {
                //       bool isSelected = days[index] == selectedDay;
                //       return GestureDetector(
                //         onTap: () {
                //           // 2. تحديث الحالة عند الضغط
                //           setState(() {
                //             selectedDay = days[index];
                //           });
                //         },
                //         child: Container(
                //           width: 70,
                //           margin: const EdgeInsets.only(right: 12),
                //
                //
                //
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(16),
                //             // تغيير اللون حسب الاختيار
                //             color: isSelected ? AppColors.secondryLight : Colors.white,
                //             border: Border.all(
                //               color: isSelected ? Colors.transparent : Colors.grey.shade300,
                //             ),
                //             boxShadow: isSelected
                //                 ? [BoxShadow(color: AppColors.primaryLight.withOpacity(0.3), blurRadius: 8, offset: Offset(0, 4))]
                //                 : [],
                //           ),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Text(
                //                 days[index].substring(0, 3),
                //                 style: TextStyle(
                //                   color: isSelected ? Colors.white : Colors.black54,
                //                   fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                //                 ),
                //               ),
                //               const SizedBox(height: 5),
                //               Text(
                //                 "${17 + index}",
                //                 style: TextStyle(
                //                   color: isSelected ? Colors.white : Colors.black,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),

                const SizedBox(height: 30),

                // --- عرض برنامج اليوم المختار ---
                // if (weeklySchedule[selectedDay] != null)
                //   ...weeklySchedule[selectedDay]!.map((lesson) {
                //     return
                ...List.generate(schedule.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      border: Border.all(color: const Color(0xC6C5D426)
                          .withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF007F6D).withOpacity(0.3),
                          offset: Offset(-8, 8), // left + bottom
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${schedule[index].start_time} - ${schedule[index].end_time}",
                            style: TextStyle(
                              color: AppColors.secondryLight,
                              fontSize: AppFonts.bodyRegularSize,
                              fontWeight: AppFonts.bodyLargeWeight
                            )),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(

                              schedule[index].material,
                              style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .colorScheme
                                      .primary,
                                  fontWeight: AppFonts.headRegularWeight,
                                  fontSize: AppFonts.headRegularSize
                              ),
                            ),

                            //رقم الحصة
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: const Color(0xA8EDFF4D)
                                  .withOpacity(0.2),
                              child: Text("${index+1}", style: TextStyle(
                                  color: AppColors.primaryLight)),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),

                        Text(
                          role == "teacher"
                              ? "Section ${schedule[index].section ?? ''} - Study Stage ${schedule[index].studyStage ?? ''}"
                              : (schedule[index].teacher ?? schedule[index].period),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        // Text(
                        //     lesson['title'],
                        //     style: Theme
                        //         .of(context)
                        //         .textTheme
                        //         .labelLarge
                        // ),
                      ],
                    ),
                  );
                })
                // Container(
                //   margin: const EdgeInsets.only(bottom: 15),
                //   width: double.infinity,
                //   padding: const EdgeInsets.all(24),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(12),
                //     color: Colors.white,
                //     border: Border.all(color: const Color(0xC6C5D426)
                //         .withOpacity(0.2)),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Color(0xFF007F6D).withOpacity(0.3),
                //         offset: Offset(-8, 8), // left + bottom
                //         blurRadius: 10,
                //         spreadRadius: 1,
                //       ),
                //     ],
                //   ),
                //   child: Column(
                //     children: [
                //       Text(schedule, style: Theme
                //           .of(context)
                //           .textTheme
                //           .bodyMedium),
                //       const SizedBox(height: 10),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             schedule.material,
                //             style: TextStyle(
                //                 color: Theme
                //                     .of(context)
                //                     .colorScheme
                //                     .primary,
                //                 fontWeight: AppFonts.headRegularWeight,
                //                 fontSize: AppFonts.headRegularSize
                //             ),
                //           ),
                //           // Text(
                //           //   "Grade ${lesson['grade']} / section ${lesson['section']}",
                //           //   style: TextStyle(
                //           //       color: Theme
                //           //           .of(context)
                //           //           .colorScheme
                //           //           .primary,
                //           //       fontWeight: AppFonts.headRegularWeight,
                //           //       fontSize: AppFonts.headRegularSize
                //           //   ),
                //           // ),
                //           //رقم الحصة
                //           CircleAvatar(
                //             radius: 18,
                //             backgroundColor: const Color(0xA8EDFF4D)
                //                 .withOpacity(0.2),
                //             child: Text(schedule.period, style: TextStyle(
                //                 color: AppColors.primaryLight)),
                //           )
                //         ],
                //       ),
                //       const SizedBox(height: 10),
                //       Text(
                //           schedule.end_time,
                //           style: Theme
                //               .of(context)
                //               .textTheme
                //               .labelLarge
                //       ),
                //       // Text(
                //       //     lesson['title'],
                //       //     style: Theme
                //       //         .of(context)
                //       //         .textTheme
                //       //         .labelLarge
                //       // ),
                //     ],
                //   ),
                // )
                // }).toList()
                // else
                //   const Center(child: Text("No classes for this day")), // إذا كان اليوم فارغاً
              ],
            );
          }
          ),
        ),
      ),
    );
  }
}