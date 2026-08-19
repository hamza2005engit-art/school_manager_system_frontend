class AttendanceModel {
  final bool success;
  final List<AttendanceData> data;

  AttendanceModel({required this.success, required this.data});

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      success: json['success'] ?? false,
      data: (json['data'] as List? ?? []).map((e) => AttendanceData.fromJson(e)).toList(),
    );
  }
}

class AttendanceData {
  final String day;
  final String date;
  final double rate;

  AttendanceData({required this.day, required this.date, required this.rate});

  factory AttendanceData.fromJson(Map<String, dynamic> json) {
    return AttendanceData(
      day: json['day'] ?? '',
      date: json['date'] ?? '',
      rate: (json['rate'] ?? 0).toDouble(),
    );
  }
}