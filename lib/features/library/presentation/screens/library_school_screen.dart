import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_project1/core/theme/app_theme.dart';
import 'package:student_project1/core/utils/devices_type.dart';
import 'package:student_project1/features/library/presentation/widgets/custom_column_library.dart';
import '../controller/library_controller.dart';

class LibrarySchoolScreen extends StatelessWidget {
  const LibrarySchoolScreen({super.key, required this.libraryController});
  final LibraryController libraryController;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
        body: SafeArea(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: screenWidth,
                height: screenHeight,
                child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      var deviceType = getDeviceType(mediaQuery);
                      double localHeight = constraints.maxHeight;
                      double localWidth = constraints.maxWidth;

                      return Obx(() {
                        if (libraryController.isLoading.value) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (libraryController.schoolBooks.isEmpty) {
                          return  Center(child: Text("No School books found".tr));
                        }

                        return ListView(
                            children: [
                              const SizedBox(height: 20),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: libraryController.schoolBooks.length,
                                  itemBuilder: (context, index) {
                                    final book = libraryController.schoolBooks[index];
                                    return Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: localWidth * .02,
                                            vertical: 15),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(32),
                                            color: AppTheme.lightTheme.colorScheme.surface
                                        ),
                                        child: CustomColumnLibrary(
                                          localWidth: localWidth,
                                          image: book.imageBook,
                                          title: book.titleBook,
                                          url: book.linkBook,
                                        )
                                    );
                                  }
                              )
                            ]
                        );
                      });
                    }
                )
            )
        )
    );
  }
}