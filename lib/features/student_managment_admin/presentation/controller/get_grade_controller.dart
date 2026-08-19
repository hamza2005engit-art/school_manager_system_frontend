import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:student_project1/features/student_managment_admin/data/model/get_grade_model.dart';

class GetGradeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<StudyStageModel> grades = <StudyStageModel>[].obs;
  RxList<int> sections = <int>[].obs;

  RxInt selectedGradeId = 0.obs;
  RxInt selectedSection = 0.obs;

  // تعريف المتغير القابل للحذف (Nullable) بطريقة GetX الأسهل
  final Rxn<StudyStageModel> selectedGrade = Rxn<StudyStageModel>();

  @override
  void onInit() {
    getGrades();
    super.onInit();
  }

  Future<void> getGrades() async {
    try {
      isLoading.value = true;

      // تنظيف البيانات السابقة عند بدء التحميل
      grades.clear();
      sections.clear();
      selectedSection.value = 0;
      selectedGradeId.value = 0;
      selectedGrade.value = null; // تم إصلاحها هنا لمنع تعليق البيانات القديمة

      final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/v1/get_study_stage'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);

        if (data['data'] != null) {
          grades.value = (data['data'] as List)
              .map((e) => StudyStageModel.fromJson(e))
              .toList();
        }
      } else {
        Get.snackbar(
          "Error",
          "Failed to load grades (Status: ${response.statusCode})",
        );
      }
    } catch (e) {
      print("Error fetching grades: $e");
      // تنبيه المستخدم في حال فشل الاتصال بالسيرفر تماماً
      Get.snackbar(
        "Connection Error",
        "Something went wrong. Please check your internet connection.",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void selectGrade(StudyStageModel grade) {
    selectedGrade.value = grade;
    selectedGradeId.value = grade.id;

    // تأكد أن مصفوفة الصفوف/الأقسام ليست فارغة في الموديل
    sections.value = grade.sectionNumbers ?? [];
    print(sections);
    selectedSection.value = 0;
  }

  void selectSection(int section) {
    selectedSection.value = section;
  }
}