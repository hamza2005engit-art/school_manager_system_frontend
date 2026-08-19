import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:student_project1/features/home_page/data/model/attendance_model.dart';
class StudentAttendance extends StatelessWidget {
  final int numTeachers;
  final int numStudents;
  final List<AttendanceData> attendanceList;

  const StudentAttendance({
    super.key,
    required this.numTeachers,
    required this.numStudents,
    required this.attendanceList,
  });

  @override
  Widget build(BuildContext context) {
    List<FlSpot> chartSpots = attendanceList.asMap().entries.map((entry) {
      int index = entry.key;
      AttendanceData data = entry.value;

      double yValue = double.tryParse(data.rate.toString()) ?? 0.0;

      return FlSpot(index.toDouble(), yValue);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.school, color: Colors.white, size: 28),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text('Students'.tr, style: TextStyle(color: Colors.white, fontSize: 14)),
                        Text("$numStudents", style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 90,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFB9C0D9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person, color: Colors.white, size: 28),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("Teachers".tr, style: TextStyle(color: Colors.white, fontSize: 14)),
                        Text("$numTeachers", style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),
         Text("Student Attendance".tr, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),

        SizedBox(
          height: 250,
          child: chartSpots.isEmpty
              ?  Center(child: Text("No Attendance Data Available".tr))
              : LineChart(
            LineChartData(
              minY: 0,
              maxY: 100,
              minX: 0,
              maxX: attendanceList.length > 1 ? (attendanceList.length - 1).toDouble() : 1.0,
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index >= 0 && index < attendanceList.length) {
                        String dayName = attendanceList[index].day.toString();
                        if (dayName.length > 3) {
                          dayName = dayName.substring(0, 3);
                        }
                        return SideTitleWidget(
                          meta: meta,
                          child: Text(
                            dayName,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                ),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: const FlGridData(show: true, drawVerticalLine: false),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                  left: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: chartSpots,
                  isCurved: true,
                  barWidth: 4,
                  color: Theme.of(context).colorScheme.primary,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}