import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/core/widget/CustomappBar.dart';
import 'package:student_project1/features/auth/presentation/controllers/logout_constroller.dart';
import 'package:student_project1/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/devices_type.dart';
import '../../../../core/widget/container_image.dart';
import '../../../../core/widget/customBottomNavigatorBar.dart';
import '../../../../core/widget/custom_button_large.dart';
import '../../../../core/widget/custom_profile_into_card.dart';
import '../../../../core/widget/row_card_profie.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../language_selection_screen.dart';
import '../../../schedule/presentation/screens/schedule.dart';
import '../controllers/profile_controller.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  final role = (GetStorage().read('role') ?? '').toString();

  final Map<String, dynamic> roleData = const {
    'student': {
      'name': 'Ali',
      'grade': '10',
      'section': '2',
      'id_student': '122465',
      'school': 'ALFallogee School',
      'age': '18',
      'location': 'Damascus',
    },
  };

  final ProfileController profileController =
  Get.find<ProfileController>();
  final String name = GetStorage().read('name');

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      drawer: Drawer(),
      appBar: CustomAppBar(name: name,),
      bottomNavigationBar: CustomBottomNavigator(
          currentIndex: role == 'admin' ? 3 : 4,
          onTap: (index) {
            if(role=='teacher' || role == 'student') {
              if (index == 0) {
                if (role == 'teacher') {
                  Get.toNamed(Routes.STUDENTSFORTEACHER);
                } else {
                  Get.offNamed(Routes.MARKS);
                }
              }
              if (index == 1) {
                Get.offNamed(Routes.SCHEDULE);
              }
              if (index == 2) {
                Get.offNamed(Routes.Home1);
              }
              if(index == 3) {
                Get.toNamed(Routes.TASK);
              }
            } else {
              if(index == 0) {
                Get.offNamed(Routes.StudentManagmetAdmin);
              }
              if(index == 2) {
                Get.toNamed(Routes.TASK);
              }
              if(index == 1)  {
                Get.offNamed(Routes.Home1);
              }
            }
          },
        bottomNavigatorBarItem: [
          BottomNavigationBarItem(
            icon: Icon(
                role == 'teacher' || role =='admin' ?
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
          margin: const EdgeInsets.symmetric(horizontal: 15),
          width: screenWidth,
          height: screenHeight,
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints constraints) {
              var deviceType = getDeviceType(mediaQuery);
              double localHeight = constraints.maxHeight;
              double localWidth = constraints.maxWidth;

              return Obx(() {
                final profile = profileController.profile.value;

                if (profile == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView(
                  children: [
                    const SizedBox(height: 20),

                    Text(
                      "manage your profile and your appearance here".tr,
                      style: AppTextStyle.bodyLargeLight,
                    ),

                    const SizedBox(height: 30),

                    Container(
                      padding: const EdgeInsets.all(24),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mainQuotaContainerLight,
                            AppColors.mainQuotaContainer2Light,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 128,
                            height: 128,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFFFFFFF)
                                    .withOpacity(0.2),
                                width: 4,
                              ),
                            ),
                            child: ContainerImage(imagePath: profileController.profile.value!.profile_image)

                          ),

                          const SizedBox(height: 25),

                          Text(
                            profile.full_name ?? '',
                            style: TextStyle(
                              color:
                              AppColors.textFeildLight,
                              fontWeight:
                              AppFonts.headRegularWeight,
                              fontSize:
                              AppFonts.headRegularSize,
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Text(
                          //   "Grade ${roleData['student']['grade']} - (section ${roleData['student']['section']})",
                          //   style: TextStyle(
                          //     color:
                          //     AppColors.textFeildLight,
                          //     fontSize:
                          //     AppFonts.bodyRegularSize,
                          //     fontWeight:
                          //     AppFonts.bodyLargeWeight,
                          //   ),
                          // ),
                          //
                          // const SizedBox(height: 10),
                          //
                          // Container(
                          //   width: 158,
                          //   alignment: Alignment.center,
                          //   padding:
                          //   const EdgeInsets.symmetric(
                          //     horizontal: 12,
                          //     vertical: 4,
                          //   ),
                          //   decoration: BoxDecoration(
                          //     color:
                          //     AppColors.textFeildLight,
                          //     borderRadius:
                          //     BorderRadius.circular(
                          //         9999),
                          //   ),
                          //   child: Text(
                          //     "ID: ${roleData['student']['id_student']}",
                          //     style: TextStyle(
                          //       color:
                          //       const Color(0xFF545455),
                          //       fontSize:
                          //       AppFonts.bodyRegularSize,
                          //       fontWeight:
                          //       AppFonts.bodyLargeWeight,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Personal Details".tr,
                      style: TextStyle(
                        fontWeight:
                        AppFonts.headRegularWeight,
                        fontSize:
                        AppFonts.headRegularSize,
                        color: const Color(0xFF181C1E),
                      ),
                    ),

                    const SizedBox(height: 10),

                    ProfileInfoCard(
                      cardProfile: [
                        CustomRowProfile(
                          title: 'School'.tr,
                          text: "Al-Saada School".tr,
                          icon: Icons.school,
                        ),
                        CustomRowProfile(
                          title: 'phone'.tr,
                          text:
                          profileController.profile.value!.phone,
                          icon: Icons.phone,
                        ),

                        CustomRowProfile(
                          title: 'Email'.tr,
                          text:profileController.profile.value!.email,
                          icon:
                          Icons.email,
                        ),

                        CustomRowProfile(
                          title: 'Location'.tr,
                          text: profile.location ?? '',
                          icon: Icons.location_on,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Account Settings".tr,
                      style: TextStyle(
                        fontWeight:
                        AppFonts.headRegularWeight,
                        fontSize:
                        AppFonts.headRegularSize,
                        color: const Color(0xFF181C1E),
                      ),
                    ),

                    const SizedBox(height: 10),

                    ProfileInfoCard(
                      cardProfile: [
                        CustomRowProfile(
                          title: 'Language (اللغة)'.tr,
                          text: 'Switch between English &\nArabic'.tr,
                          icon: Icons.language,
                          onTap: () {
                            Get.to(() => const LanguageSelectionScreen());
                          },
                        ),

                        CustomRowProfile(
                          title: 'Theme (الثيم)'.tr,
                          text: 'Light or Dark environment'.tr,
                          icon: Icons.brightness_6,
                        ),
                      ],
                    ),

                    const SizedBox(height: 50),

                    CustomLargeButton(
                      onPressed: () {
                        Get.find<LogoutController>().logout();
                      },
                      title: 'Logout'.tr,
                    ),

                    const SizedBox(height: 20),
                  ],
                );
              });
            },
          ),
        ),
      ),
    );
  }
}