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
      // إذا كانت البيانات القادمة عبارة عن Object / Map
      parsedSections = rawSection.values
          .map((e) => int.tryParse(e.toString()) ?? 0)
          .toList();
    } else if (rawSection is List) {
      // إذا كانت البيانات القادمة عبارة عن Array / List
      parsedSections = rawSection
          .map((e) => int.tryParse(e.toString()) ?? 0)
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