import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:student_project1/features/home/presentation/screens/home_screen.dart';

class NavigationController extends GetxController{
  final RxInt currentIndex = 2.obs;

  // TODO: complete the pages
  final List<Widget> pages = [
    const Center(child: Text("page 0"),),
    const Center(child: Text("page 1"),),
    const HomeScreen(),
    const Center(child: Text("page 3"),),
    const Center(child: Text("page 4"),),
  ];

  void changePage(int index){
    currentIndex.value = index;
  }
}
