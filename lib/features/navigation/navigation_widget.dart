import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/features/navigation/navigation_controller.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find<NavigationController>();
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 16),
            Text("User", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: (value) {
              controller.changePage(value);
            },
            selectedIconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent, // لجعل خلفية الـ Container هي الظاهرة
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedItemColor: Colors.white70,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                label: 'Marks',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Schedule',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.home),
                ),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined),
                label: 'Tasks',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
