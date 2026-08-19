import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../student_management/presentation/controller/student_mangment_controller.dart';
import '../controllers/update_mark_controller.dart';

class TextFiledMark extends StatelessWidget {
  final double localWidth;
  final String text;
  final String studentId;
  final String materialId;

  TextFiledMark({
    super.key,
    required this.localWidth,
    required this.text,
    required this.studentId,
    required this.materialId,
  });

  final UpdateMarkController controller = Get.find<UpdateMarkController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: controller.scoreController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter your new mark".tr,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            return controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(localWidth * 0.5, 45),
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                final String newScore = controller.scoreController.text.trim();
                final String currentType = controller.selectedType.value;

                await controller.updateMark(
                  studentId: studentId,
                  materialId: materialId,
                );

                if (!controller.isLoading.value) {
                  if (Get.isRegistered<StudentMangmentController>()) {
                    Get.find<StudentMangmentController>().getStudents();
                  }
                  final studentDetailsArgs = Get.arguments;
                  if (studentDetailsArgs != null) {
                    if (currentType == 'final') {
                      studentDetailsArgs.finalMark = newScore;
                    } else if (currentType == 'test') {
                      studentDetailsArgs.testMark = newScore;
                    }
                  }
                  controller.update();
                  Get.back();
                }
              },
              child:  Text(
                "Save Mark".tr,
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}