import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/core/theme/app_colors.dart';
import 'package:student_project1/core/theme/app_fonts.dart';
import 'package:student_project1/core/theme/app_text_style.dart';
import 'package:student_project1/core/widget/CustomappBar.dart';
import 'package:student_project1/core/widget/customBottomNavigatorBar.dart';
import 'package:student_project1/features/student_managment_admin/domain/entity/student_managment_admin_entity.dart';
import 'package:student_project1/features/student_managment_admin/presentation/controller/get_grade_controller.dart';
import 'package:student_project1/features/student_managment_admin/presentation/controller/student_managment_admin_controller.dart';
import 'package:student_project1/routes/app_routes.dart';

class StudentManagmentAdmin extends StatelessWidget {
  StudentManagmentAdmin({super.key});

  final role = (GetStorage().read('role') ?? '').toString();
  final name = GetStorage().read('name') ?? '';

  final GetGradeController getGradeController = Get.find<GetGradeController>();
  final StudentManagmentAdminController studentManagmentAdminController =
  Get.find<StudentManagmentAdminController>();

  // ─── ألوان الحالة ───────────────────────────────────────────────────────────
  Color _statusColor(String status) {
    switch (status) {
      case 'present':
        return const Color(0xFF2E7D32); // أخضر داكن
      case 'absent':
        return const Color(0xFFC62828); // أحمر داكن
      case 'excused':
        return const Color(0xFFE65100); // برتقالي داكن
      default:
        return Colors.grey.shade600;
    }
  }

  Color _statusBgColor(String status) {
    switch (status) {
      case 'present':
        return const Color(0xFFE8F5E9);
      case 'absent':
        return const Color(0xFFFFEBEE);
      case 'excused':
        return const Color(0xFFFFF3E0);
      default:
        return Colors.grey.shade100;
    }
  }

  IconData _statusIcon(String status) {
    switch (status) {
      case 'present':
        return Icons.check_circle_rounded;
      case 'absent':
        return Icons.cancel_rounded;
      case 'excused':
        return Icons.info_rounded;
      default:
        return Icons.help_rounded;
    }
  }

  String _statusLabel(String status) {
    switch (status) {
      case 'present':
        return 'Present';
      case 'absent':
        return 'Absent';
      case 'excused':
        return 'Excused';
      default:
        return status;
    }
  }

  // ─── جلب الطلاب ─────────────────────────────────────────────────────────────
  void loadStudents() {
    if (getGradeController.selectedSection.value == 0 ||
        getGradeController.selectedGrade.value == null) {
      studentManagmentAdminController.students.clear();
      return;
    }
    studentManagmentAdminController.getStudents(
      getGradeController.selectedSection.value,
      getGradeController.selectedGrade.value!.stageNumber,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const Drawer(),
      appBar: CustomAppBar(name: name),
      bottomNavigationBar: CustomBottomNavigator(
        currentIndex: 0,
        onTap: (index) {
          if (role == 'student' || role == 'teacher') {
            if (index == 2) Get.offNamed(Routes.Home1);
            if (index == 1) Get.offNamed(Routes.SCHEDULE);
            if (index == 4) Get.offNamed(Routes.PROFILE);
            if (index == 3) Get.toNamed(Routes.TASK);
          } else {
            if (index == 1) Get.offNamed(Routes.Home1);
            if (index == 3) Get.toNamed(Routes.PROFILE);
            if (index == 2) Get.toNamed(Routes.TASK);
          }
        },
        bottomNavigatorBarItem: [
          BottomNavigationBarItem(
            icon: Icon(
              role == 'teacher' || role == 'admin'
                  ? Icons.groups
                  : Icons.assignment_turned_in,
            ),
            label: role == 'teacher' || role == 'admin' ? 'Students' : 'Marks',
          ),
          if (role == 'student' || role == 'teacher')
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Schedule',
            ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.task), label: 'Task'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          width: screenWidth,
          height: screenHeight,
          child: Obx(() {
            return ListView(
              children: [
                const SizedBox(height: 16),

                // ─── العنوان ──────────────────────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Students".tr,
                      style: TextStyle(
                        color: AppColors.primaryLight,
                        fontFamily: AppFonts.fontName,
                        fontSize: AppFonts.headLargeSize,
                        fontWeight: AppFonts.headLargeWeight,
                      ),
                    ),
                    // عدد الطلاب
                    if (studentManagmentAdminController.students.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "${studentManagmentAdminController.students.length} ${'students'.tr}",
                          style: TextStyle(
                            color: AppColors.primaryLight,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 12),

                // ─── Dropdown الشعبة ──────────────────────────────────────────
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: getGradeController.selectedSection.value == 0
                          ? null
                          : getGradeController.selectedSection.value,
                      hint: Text("Select Section".tr),
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down_rounded,
                          color: AppColors.primaryLight),
                      items: List.generate(
                        getGradeController.sections.length,
                            (index) => DropdownMenuItem<int>(
                          value: getGradeController.sections[index],
                          child: Text(
                              "${"Section".tr} ${getGradeController.sections[index]}"),
                        ),
                      ),
                      onChanged: (value) {
                        if (value != null) {
                          getGradeController.selectSection(value);
                          loadStudents();
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ─── الصفوف أفقياً ────────────────────────────────────────────
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                    itemCount: getGradeController.grades.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final currentGrade = getGradeController.grades[index];
                      final bool isSelected =
                          getGradeController.selectedGrade.value?.id ==
                              currentGrade.id;

                      return GestureDetector(
                        onTap: () {
                          getGradeController.selectGrade(currentGrade);
                          loadStudents();
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 85,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: isSelected
                                ? AppColors.primaryLight
                                : Colors.white,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primaryLight
                                  : Colors.grey.shade200,
                            ),
                            boxShadow: isSelected
                                ? [
                              BoxShadow(
                                color: AppColors.primaryLight
                                    .withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              )
                            ]
                                : [],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Grade".tr,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white70
                                      : Colors.black45,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${currentGrade.stageNumber}",
                                style: TextStyle(
                                  color:
                                  isSelected ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // ─── Loading ──────────────────────────────────────────────────
                if (studentManagmentAdminController.isLoading.value)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else ...[
                  // ─── زر الحفظ (يظهر فقط عند وجود تعديلات) ─────────────────
                  if (studentManagmentAdminController.hasChanges)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed:
                          studentManagmentAdminController.isSaving.value
                              ? null
                              : () =>
                              studentManagmentAdminController
                                  .saveAttendance(
                                getGradeController
                                    .selectedSection.value,
                              ),
                          icon: studentManagmentAdminController.isSaving.value
                              ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                              : const Icon(Icons.save_rounded,
                              color: Colors.white, size: 20),
                          label: Text(
                            studentManagmentAdminController.isSaving.value
                                ? 'Saving...'.tr
                                : '${'Save Changes'.tr} (${studentManagmentAdminController.localStatusChanges.length})',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryLight,
                            disabledBackgroundColor:
                            AppColors.primaryLight.withOpacity(0.6),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ),

                  // ─── قائمة الطلاب ─────────────────────────────────────────
                  if (studentManagmentAdminController.students.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Icon(Icons.group_off_rounded,
                                size: 56, color: Colors.grey.shade400),
                            const SizedBox(height: 12),
                            Text(
                              "No students found".tr,
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 15),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Select a grade and section".tr,
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ListView.builder(
                      itemCount:
                      studentManagmentAdminController.students.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final student =
                        studentManagmentAdminController.students[index];
                        return _StudentCard(
                          student: student,
                          index: index,
                          role: role,
                          controller: studentManagmentAdminController,
                          gradeController: getGradeController,
                          statusColor: _statusColor,
                          statusBgColor: _statusBgColor,
                          statusIcon: _statusIcon,
                          statusLabel: _statusLabel,
                        );
                      },
                    ),
                ],

                const SizedBox(height: 24),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// ─── Widget منفصل لكارد الطالب ────────────────────────────────────────────────
class _StudentCard extends StatelessWidget {
  final StudentManagmentAdminEntity student;
  final int index;
  final String role;
  final StudentManagmentAdminController controller;
  final GetGradeController gradeController;
  final Color Function(String) statusColor;
  final Color Function(String) statusBgColor;
  final IconData Function(String) statusIcon;
  final String Function(String) statusLabel;

  const _StudentCard({
    required this.student,
    required this.index,
    required this.role,
    required this.controller,
    required this.gradeController,
    required this.statusColor,
    required this.statusBgColor,
    required this.statusIcon,
    required this.statusLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final status = controller.getStatus(student);
      final color = statusColor(status);
      final bgColor = statusBgColor(status);
      final isModified = controller.localStatusChanges.containsKey(student.id);

      return InkWell(
        onTap: () {
          if (role == 'teacher') {
            Get.toNamed(Routes.STUDENTDETAILS);
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isModified ? color.withOpacity(0.5) : Colors.grey.shade100,
              width: isModified ? 1.5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                // ─── رقم الترتيب ──────────────────────────────────────
                Container(
                  width: 28,
                  height: 28,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // ─── الصورة مع نقطة الحالة ────────────────────────────
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: student.profileImage != null &&
                          student.profileImage!.isNotEmpty
                          ? NetworkImage(student.profileImage!)
                          : const AssetImage(
                          'assets/images/Profile Photo.png')
                      as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),

                // ─── الاسم والـ ID ────────────────────────────────────
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.fullName,
                        style: AppTextStyle.studentManagement,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            student.studentId,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.labelFontLight,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.primaryLight.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "${gradeController.selectedGrade.value?.stageNumber ?? ''}/${gradeController.selectedSection.value}",
                              style: TextStyle(
                                fontSize: 10,
                                color: AppColors.primaryLight,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // ─── زر تغيير الحالة (للأدمن) ──────────────────────────
                if (role == 'admin')
                  GestureDetector(
                    onTap: () => controller.cycleStatus(student),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 7),
                      decoration: BoxDecoration(
                        color: bgColor,
                        border: Border.all(color: color.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(statusIcon(status), color: color, size: 15),
                          const SizedBox(width: 4),
                          Text(
                            statusLabel(status.tr),
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}