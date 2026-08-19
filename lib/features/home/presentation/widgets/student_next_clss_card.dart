import 'package:flutter/material.dart';

class UpNextCard extends StatelessWidget {
  final String subject;
  final String time;
  final String location;
  final String teacherName;
  final VoidCallback onSeeAllPressed;

  const UpNextCard({
    super.key,
    required this.subject,
    required this.time,
    required this.location,
    required this.teacherName,
    required this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 295,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1A397A), // اللون الأزرق الغامق
            Color(0xFF00897B), // اللون الأخضر التيل
          ],
        ),
      ),
      child: Stack(
        children: [
          // أيقونة قبعة التخرج في الخلفية (Background Icon)
          Positioned(
            right: -10,
            top: -10,
            child: Icon(
              Icons.school_outlined,
              size: 120,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // علامة UP NEXT
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'UP NEXT',
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // اسم المادة
              Text(
                'Class in\n$subject',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 15),
              // الوقت والمكان
              Row(
                children: [
                  const Icon(Icons.access_time, color: Colors.white70, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    time,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: Colors.white70, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    location,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // الخط الفاصل البسيط
              Divider(color: Colors.white.withOpacity(0.2)),
              const SizedBox(height: 10),
              // الجزء السفلي (المعلم وزر See All)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        teacherName,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: onSeeAllPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                    ),
                    child: const Text('See All'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}