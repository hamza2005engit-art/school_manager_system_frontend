import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/profile/presentation/screens/profile.dart';
import '../../features/schedule/presentation/screens/schedule.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({super.key, required this.currentIndex, required this.onTap, required this.bottomNavigatorBarItem});
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> bottomNavigatorBarItem;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1C3486),

        selectedItemColor: const Color(0xFF007F6D),
        unselectedItemColor: Colors.white,

        selectedLabelStyle: const TextStyle(
          color: Color(0xFF007F6D),
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.white,
        ),

        items: bottomNavigatorBarItem
    );
  }

}