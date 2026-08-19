class ExercisesEntity {

  int? id;
  String title;
  String content;
  String date;
  int? studyStageId;
   int? stageNumber;
//  int teacherId;
  ///String created_at;

  ExercisesEntity({
    required this.title,
    required this.content,
    required this.date,
     this.studyStageId,
     this.id,
    this.stageNumber
    // required this.created_at,
    // required this.teacherId
});

}