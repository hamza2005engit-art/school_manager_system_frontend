
import 'package:student_project1/features/home/domain/entities/fees_user.dart';
class FeesModel extends FeesUser {
  FeesModel({

    required super.toata_remaining,
    required super.toata_fees,
    required super.total,
    required super.paid,
    super.token
  });

  factory FeesModel.fromJson(Map<String, dynamic> json) {
    return FeesModel(
      toata_remaining: json['toata_remaining'],
      toata_fees: json['toata_fees'],
      total: json['total'],
      paid: json['paid'],
      token: json['access_token'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'toata_remaining': toata_remaining,
      'toata_fees': toata_fees,
      'total': total,
      'paid':paid,

    };
  }

}