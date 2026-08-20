class StudyStageModel {
  final int id;
  final int stageNumber;
  final List<int> sectionNumbers;

  StudyStageModel({
    required this.id,
    required this.stageNumber,
    required this.sectionNumbers,
  });

  factory StudyStageModel.fromJson(Map<String, dynamic> json) {
    List<int> parsedSections = [];

    final rawSection = json['section_number'];

    if (rawSection is Map) {
      // مفاتيح الـ Map هي أرقام الشعب
      parsedSections = rawSection.keys
          .map((e) => int.tryParse(e.toString()))
          .whereType<int>()
          .toList();
    } else if (rawSection is List) {
      parsedSections = rawSection
          .map((e) => int.tryParse(e.toString()))
          .whereType<int>()
          .toList();
    }

    return StudyStageModel(
      id: json['id'] ?? 0,
      stageNumber: json['stage_number'] ?? 0,
      sectionNumbers: parsedSections,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'stage_number': stageNumber,
      'section_number': sectionNumbers,
    };
  }
}