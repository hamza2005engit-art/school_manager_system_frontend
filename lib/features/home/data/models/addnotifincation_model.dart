import '../../domain/entities/addnotifincation_user.dart';

class AddNotifincationModel extends AddNotifincationUser {
  AddNotifincationModel({

    required super.grade,
    required super.content,
    required super.title,

    super.token
  });

  factory AddNotifincationModel.fromJson(Map<String, dynamic> json) {
    return AddNotifincationModel(
      grade: json['grade']??'',
      content: json['content']??'',
      title: json['title']??'',
      token: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'grade': grade,
      'content': content,
      'title': title,

    };
  }

}