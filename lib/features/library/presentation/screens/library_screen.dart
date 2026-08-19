import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/theme/app_fonts.dart';
import 'package:student_project1/features/library/presentation/screens/library_book_screen.dart';
import 'package:student_project1/features/library/presentation/screens/library_school_screen.dart';

import '../controller/library_controller.dart';

class LibraryScreen extends StatelessWidget {
   LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LibraryController libraryController = Get.find<LibraryController>();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
          title: Text(
          "Library".tr,
          style: TextStyle(color: Colors.white,
              fontWeight: AppFonts.labelRegularWeight,
              fontSize: AppFonts.headRegularSize),
        ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon:Icon(Icons.arrow_back,size: 30),),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  color: Colors.white,
                  child:  TabBar(
                    indicatorColor: Colors.white,
                    labelColor: Color(0xFF545455),
                    labelStyle: TextStyle(
                      color: Color(0xFF545455),
                    ),
                    tabs: [
                      Tab(text: "School Book".tr),
                      Tab(text: "Library Book".tr),
                    ],
                  ),
                ),
              ),
    ),
          body: TabBarView(
              children: [
                LibrarySchoolScreen(libraryController: libraryController,),
                LibraryBookScreen(libraryController: libraryController,)
              ]
          ),

        )
    );
  }

}