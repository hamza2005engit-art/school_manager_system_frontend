// student_managment_admin_controller.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/features/student_managment_admin/domain/entity/student_managment_admin_entity.dart';
import 'package:student_project1/features/student_managment_admin/domain/usecases/student_managment_admin_usecase.dart';
import 'package:student_project1/features/student_managment_admin/domain/usecases/take_attendance_usecase.dart';
import 'get_grade_controller.dart';

class StudentManagmentAdminController extends GetxController {
  final StudentManagmentAdminUseCase studentManagmentAdminUseCase;
  final TakeAttendanceUseCase takeAttendanceUseCase;

  StudentManagmentAdminController(
      this.studentManagmentAdminUseCase,
      this.takeAttendanceUseCase,
      );

  final RxList<StudentManagmentAdminEntity> students =
      <StudentManagmentAdminEntity>[].obs;

  // Map يخزن التعديلات المحلية: attendanceId -> status
  final RxMap<String, String> localStatusChanges = <String, String>{}.obs;

  RxBool isLoading = false.obs;
  RxBool isSaving = false.obs;

  @override
  void onInit() {
    super.onInit();
    getStudents(1, 1);
  }

  Future<void> getStudents(int section, int grade) async {
    try {
      isLoading.value = true;
      localStatusChanges.clear(); // مسح التعديلات عند تحميل قائمة جديدة
      students.value = await studentManagmentAdminUseCase(section, grade);
    } catch (e) {
      print('Error $e');
    } finally {
      isLoading.value = false;
    }
  }

  // الحالة الفعلية المعروضة (التعديل المحلي إن وجد، وإلا القيمة الأصلية)
  String getStatus(StudentManagmentAdminEntity student) {
    return localStatusChanges[student.id] ?? student.studentStatus;
  }

  // تبديل الحالة: present -> absent -> excused -> present
  void cycleStatus(StudentManagmentAdminEntity student) {
    final current = getStatus(student);
    final cycle = [
      'present'.tr,
      'absent'.tr,
      'excused'.tr,
    ];
    final nextIndex = (cycle.indexOf(current) + 1) % cycle.length;
    localStatusChanges[student.id] = cycle[nextIndex];
  }

  bool get hasChanges => localStatusChanges.isNotEmpty;

  // إرسال الحضور للـ API
  Future<void> saveAttendance(int sectionId) async {
    if (localStatusChanges.isEmpty) {
      _showSafeSnackbar('Info', 'No changes to save');
      return;
    }

    try {
      isSaving.value = true;

      // بناء قائمة الطلاب المعدّلين فقط
      final studentsPayload = localStatusChanges.entries.map((entry) {
        // إيجاد الطالب عن طريق attendance.id
        final student = students.firstWhere((s) => s.id == entry.key);
        return {
          'student_id': int.parse(student.studentDbId),
          'status': entry.value,
        };
      }).toList();

      await takeAttendanceUseCase(
        sectionId: sectionId,
        students: studentsPayload,
      );

      // تحديث القائمة المحلية بعد الحفظ الناجح
      for (final student in students) {
        if (localStatusChanges.containsKey(student.id)) {
          student.studentStatus = localStatusChanges[student.id]!;
        }
      }
      localStatusChanges.clear();
      students.refresh();

      // إظهار التنبيه بأمان بعد ترطيب الواجهة
      _showSafeSnackbar(
        'Success',
        'Attendance saved successfully',
        backgroundColor: const Color(0xFF4CAF50).withOpacity(0.9),
        colorText: Colors.white,
      );
    } catch (e) {
      _showSafeSnackbar('Error', 'Failed to save attendance');
    } finally {
      isSaving.value = false;
    }
  }

  // دالة مخصصة لعرض الـ Snackbar بأمان وتجنب RenderFlex Overflow
  void _showSafeSnackbar(
      String title,
      String message, {
        Color? backgroundColor,
        Color? colorText,
      }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.isSnackbarOpen == true) {
        Get.closeCurrentSnackbar();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(12),
        borderRadius: 8,
        backgroundColor: backgroundColor ?? Colors.black87,
        colorText: colorText ?? Colors.white,
        duration: const Duration(seconds: 3),
      );
    });
  }
}