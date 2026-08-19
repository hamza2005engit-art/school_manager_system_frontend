import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/core/widget/CustomappBar.dart';
import 'package:student_project1/core/widget/customBottomNavigatorBar.dart';
import 'package:student_project1/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/devices_type.dart';
import '../controller/student_mangment_controller.dart';

class StudentManagement extends StatelessWidget {
   StudentManagement({super.key});
  final bool isSelected = true;
  final role = (GetStorage().read('role') ?? '').toString();
  final name = GetStorage().read('name') ?? '';
  final StudentMangmentController studentMangmentController = Get.find<StudentMangmentController>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
        drawer: Drawer(),
        appBar: CustomAppBar(name: name,),
        bottomNavigationBar: CustomBottomNavigator(
          currentIndex: 0,
          onTap: (index) {
            if(role == 'student' || role == 'teacher') {
              if (index == 2) {
                Get.toNamed(Routes.Home1);
                // if(role=='teacher') {
                //   Get.toNamed(Routes.STUDENTSFORSUPERVISOR);
                // } else {
                //   Get.offNamed(Routes.MARKS);}
              }
              if (index == 1) {
                Get.offNamed(Routes.SCHEDULE);
              }
              if (index == 4) {
                Get.offNamed(Routes.PROFILE);
              }
              if(index == 3) {
                Get.toNamed(Routes.TASK);
              }
            } else {
              if(index == 1) {
                Get.offNamed(Routes.Home1);
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
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: screenWidth,
                height: screenHeight,
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      var deviceType = getDeviceType(mediaQuery);
                      double localHeight = constraints.maxHeight;
                      double localWidth = constraints.maxWidth;
                      return ListView(
                          children: [
                            SizedBox(height: 16,),
                            Text(
                              "Students".tr,
                              style: TextStyle(
                                color: AppColors.primaryLight,
                                fontFamily: AppFonts.fontName,
                                fontSize: AppFonts.headLargeSize,
                                fontWeight: AppFonts.headLargeWeight,
                              ),
                            ),
                            SizedBox(height: 10,),
                            //
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             // mainAxisSize: MainAxisSize.min,
                              children: [
                                // Container(
                                //   width: double.infinity,
                                //   padding: EdgeInsets.all(2),
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(25),
                                //     color: Color(0xFFFFFFFF)
                                //   ),
                                //   child:TextField(
                                //     textInputAction: TextInputAction.search,
                                //     onSubmitted: (value) {
                                //       FocusScope.of(context).unfocus();
                                //     //   if (value.trim().isEmpty) {
                                //     //     //controller.filteredApartments.value = controller.apartments;
                                //     //     //controller.fetchApartments();
                                //     //     return;
                                //     //   }
                                //     //   //controller.searchApartments(value);
                                //      },
                                //     decoration: InputDecoration(
                                //       hintText: 'Search by name or ID...'.tr,
                                //       hintStyle: TextStyle(color: AppColors.bodyFontLight),
                                //       filled: true,
                                //       fillColor: Colors.white,
                                //       prefixIcon: Icon(Icons.search,color: AppColors.bodyFontLight,),
                                //       focusedBorder: OutlineInputBorder(
                                //           borderRadius: BorderRadius.circular(16),
                                //           borderSide: BorderSide(color: AppColors.primaryLight,width: 2)
                                //       ),
                                //       enabledBorder: OutlineInputBorder(
                                //           borderRadius: BorderRadius.circular(16),
                                //         borderSide: BorderSide(color: Colors.white)
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                //
                          //       SizedBox(height: 10,),
                          //       Container(
                          //         padding: EdgeInsets.all(10),
                          //        // margin: EdgeInsets.symmetric(horizontal: 10),
                          //         width: double.infinity,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(16),
                          //         ),
                          //         child: DropdownButton(
                          //           borderRadius: BorderRadius.circular(16),
                          //           hint: Text(
                          //             "Section",
                          //             style: TextStyle(color: AppColors.bodyFontLight),
                          //           ),
                          //             items: [
                          //               DropdownMenuItem(value: '1',child: Text(
                          //                 "1",
                          //                 style: TextStyle(color: AppColors.bodyFontLight),
                          //               ),)
                          //             ],
                          //             onChanged: (value) {
                          //               print(value);
                          //             }
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          //   SizedBox(height: 30,),
                          //   //
                          // SizedBox(
                          //   height: 75,
                          //   child: ListView.builder(
                          //     itemCount: 10,
                          //     scrollDirection: Axis.horizontal,
                          //       itemBuilder: (context,index) {
                          //         return GestureDetector(
                          //           onTap: () {
                          //
                          //           },
                          //           child: Container(
                          //             width: 76.77, margin: const EdgeInsets.only(right: 12),
                          //             padding: EdgeInsets.symmetric(horizontal: 14.89,vertical: 12),
                          //             decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(16),
                          //                 color: AppColors.secondryLight
                          //             ),
                          //             child: Column(
                          //               mainAxisAlignment: MainAxisAlignment.center,
                          //               children: [
                          //                 Text(
                          //                   "Grade",
                          //                   style: TextStyle(
                          //                     color: isSelected ? Colors.white : Colors.black54,
                          //                     fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          //                   ),
                          //                 ),
                          //                 const SizedBox(height: 5),
                          //                 Text(
                          //                   "${index+1}",
                          //                   style: TextStyle(
                          //                     color: isSelected ? Colors.white : Colors.black,
                          //                     fontWeight: FontWeight.bold,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //   ),
                          // ),
                            SizedBox(height: 30,),
                            Obx(() {
                              return ListView.builder(
                                  itemCount: studentMangmentController.students
                                      .length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    print('student ${studentMangmentController.students[index]}');
                                    if(studentMangmentController.isLoading.value) {
                                      return Center(child: CircularProgressIndicator(),);
                                    }
                                    if(studentMangmentController.students.isEmpty) {
                                      return Center(child: Text("No Student"),);
                                    }
                                    return InkWell(
                                      onTap: () {
                                        if (role == 'teacher') {
                                          Get.toNamed(Routes.STUDENTDETAILS,
                                            arguments: studentMangmentController
                                                .students[index],);
                                        }
                                      },
                                      child: Card(
                                        child: ListTile(
                                          title: Text(studentMangmentController
                                              .students[index].fullName,
                                            style: AppTextStyle
                                                .studentManagement,
                                          ),
                                          leading: Image.asset(
                                            "assets/images/Profile Photo.png",
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,),
                                          subtitle: Text(
                                            studentMangmentController
                                                .students[index].studentId,
                                            style: TextStyle(
                                                fontSize: AppFonts
                                                    .labelRegularSize,
                                                fontWeight: AppFonts
                                                    .labelRegularWeight,
                                                color: AppColors.labelFontLight
                                            ),
                                          ),
                                          trailing: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              Text("${index + 1}",
                                                style: AppTextStyle
                                                    .studentManagement,),
                                              SizedBox(height: 3,),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 64.58,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 4),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(9999),
                                                    color: AppColors
                                                        .primaryLight
                                                ),
                                                child: Text(
                                                  "${studentMangmentController
                                                      .students[index]
                                                      .grade}/${studentMangmentController
                                                      .students[index]
                                                      .section}",
                                                  style: TextStyle(
                                                      fontWeight: AppFonts
                                                          .headRegularWeight,
                                                      fontSize: 10,
                                                      color: Colors.white
                                                  ),),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                              );
                            }
                            )
                            ]
                      )

                    ]
                      );
                          }
                )
            )
        )
    );

  }
  
}

