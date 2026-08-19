import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/core/widget/CustomappBar.dart';
import 'package:student_project1/core/widget/customBottomNavigatorBar.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widget/costum_gridmarks.dart';
import '../../../../core/widget/costum_totaacademi.dart';
import '../../../../routes/app_routes.dart';
import '../../../home_page/domain/entities/average_student_entity.dart';
import '../../../home_page/presentation/controllers/average_controller.dart';
import '../controllers/addnotifincation_controller.dart';
import '../controllers/navbar_controller.dart';

class MarksStudentScreen extends StatefulWidget {
  const MarksStudentScreen({super.key});

  @override
  State<MarksStudentScreen> createState() => _NotifincationScreenState();
}

class _NotifincationScreenState extends State<MarksStudentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AddNotfincationController controller = Get.find<AddNotfincationController>();
  final NavBarController navarController = Get.find<NavBarController>();
  final role = GetStorage().read('role');
  final name = GetStorage().read('name');
  final AverageController averageController = Get.find<AverageController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigator(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Get.offNamed(Routes.SCHEDULE);
          }
          if (index == 2) {
            Get.offNamed(Routes.Home1);
          }
          if (index == 4) {
            Get.offNamed(Routes.PROFILE);
          }
          if (index == 3) {
            Get.toNamed(Routes.TASK);
          }
        },
        bottomNavigatorBarItem: [
          BottomNavigationBarItem(
            icon: Icon(
              role == 'teacher' ? Icons.groups : Icons.assignment_turned_in,
            ),
            label: role == 'teacher' || role == 'admin' ? 'Students' : 'Marks',
          ),
          if (role == 'student' || role == 'teacher')
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Schedule',
            ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Task',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      drawer: const Drawer(),
      appBar: CustomAppBar(name: name),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "My Marks".tr,
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.mymarksDark
                          : AppColors.mymarksLight,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 1. عرض الجدول مع الاستماع للبيانات عبر Obx
                  Obx(() {
                    if (averageController.isLoading.value) {
                      return const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (averageController.averageStudentList.isEmpty) {
                      return const SizedBox(
                        height: 200,
                        child: Center(child: Text("لا توجد علامات متاحة حالياً")),
                      );
                    }

                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: SfDataGrid(
                        source: MarksDataSource(averageController.averageStudentList),
                        gridLinesVisibility: GridLinesVisibility.both,
                        headerGridLinesVisibility: GridLinesVisibility.both,
                        columnWidthMode: ColumnWidthMode.fill,
                        columns: [
                          GridColumn(
                            columnName: 'subject',
                            label: Container(
                              color: const Color(0xFF1C3486),
                              alignment: Alignment.center,
                              child: const Text(
                                'Subject',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'exercises',
                            label: Container(
                              color: const Color(0xFF1C3486),
                              alignment: Alignment.center,
                              child: const Text(
                                'Exercises',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'test',
                            label: Container(
                              color: const Color(0xFF1C3486),
                              alignment: Alignment.center,
                              child: const Text(
                                'Test',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'final',
                            label: Container(
                              color: const Color(0xFF1C3486),
                              alignment: Alignment.center,
                              child: const Text(
                                'Final',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          GridColumn(
                            columnName: 'total',
                            label: Container(
                              color: const Color(0xFF1C3486),
                              alignment: Alignment.center,
                              child: const Text(
                                'Total',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 16),

                  // 2. حساب المجموع أو المعدل العام لجميع المواد ديناميكياً
                  Obx(() {
                    double overallAverage = 0.0;

                    if (averageController.averageStudentList.isNotEmpty) {
                      double sum = averageController.averageStudentList
                          .fold(0, (prev, element) => prev + element.average);
                      overallAverage =
                          sum / averageController.averageStudentList.length;
                    }

                    return totalacademi(
                      total_acdemi: double.parse(overallAverage.toStringAsFixed(1)),
                      class_rank: "8",
                      degre: overallAverage >= 90
                          ? 'A+'
                          : overallAverage >= 80
                          ? 'A'
                          : overallAverage >= 70
                          ? 'B'
                          : 'C',
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}