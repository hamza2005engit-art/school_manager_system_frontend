import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      super.material,
      super.materialId,
      super.section,
      super.stage_number,
      super.salary, {
        required super.id,
        required super.name,
        required super.email,
        super.token,
        super.role,
      });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userData = json['user'] as Map<String, dynamic>? ?? {};
    final materialsList = json['material'] as List? ?? [];
    final gradeList = json['grade'] as List? ?? []; // جلب مصفوفة الـ grade من الـ JSON الأساسي

    // 1. استخراج الـ material_id بشكل آمن
    String? extractedMaterialId;
    if (materialsList.isNotEmpty) {
      final firstMaterial = materialsList[0] as Map<String, dynamic>? ?? {};
      final pivot = firstMaterial['pivot'] as Map<String, dynamic>? ?? {};
      extractedMaterialId = pivot['material_id']?.toString();
    }

    // 2. استخراج الـ stage_number من داخل مصفوفة grade بشكل آمن
    // بناءً على الـ JSON الخاص بك: "grade": [{"stage_number": 7, ...}]
    List<dynamic> extractedStages = [];
    if (gradeList.isNotEmpty) {
      for (var item in gradeList) {
        if (item is Map<String, dynamic> && item.containsKey('stage_number')) {
          extractedStages.add(item['stage_number']);
        }
      }
    }

    return UserModel(
      materialsList,
      extractedMaterialId,
      json['section'] as List? ?? [],
      extractedStages, // نمرر هنا قائمة أرقام المراحل الدراسية المستخرجة [7]
      json['salary'] ?? 0,
      id: userData['id'] is int
          ? userData['id']
          : int.parse(userData['id']?.toString() ?? '0'),
      name: userData['full_name'] ?? userData['name'] ?? '',
      email: userData['email'] ?? '',
      token: json['token'] ?? '',
      role: userData['roles'] != null && (userData['roles'] as List).isNotEmpty
          ? userData['roles'][0].toString()
          : '',
    );
  }
}