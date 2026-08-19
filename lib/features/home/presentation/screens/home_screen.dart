import 'package:flutter/material.dart';
import 'package:student_project1/features/home/presentation/widgets/student_next_clss_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome back,"),
              const Text("Hamza"),
              UpNextCard(
                subject: 'History',
                time: '9:45 AM - 10:30 AM',
                location: 'in your class',
                teacherName: 'Mr. Name',
                onSeeAllPressed: () {
                  // ignore: avoid_print
                  print("See All clicked!");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
