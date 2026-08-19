import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widget/costum_drobdown.dart';
import '../../../../core/widget/custom_notifincation_card.dart';

import '../../../../core/widget/custom_text_field.dart';
import '../../../../core/widget/next_buttom.dart';
import '../../../../routes/app_routes.dart';
import '../controllers/addnotifincation_controller.dart';
import '../controllers/notfincation_controller.dart';

class NotifincationScreen extends StatefulWidget {
  const NotifincationScreen({super.key});

  @override
  State<NotifincationScreen> createState() => _NotifincationScreenState();
}

class _NotifincationScreenState extends State<NotifincationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final NotfincationController notifController = Get.find<NotfincationController>();
  final AddNotfincationController addController = Get.find<AddNotfincationController>();

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
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF1C3486),
        title: Text(
          "Notifincations",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Color(0xFF00D4B6),
              labelColor: Color(0xFF00D4B6),
              unselectedLabelColor:
              Theme.of(context).brightness == Brightness.dark
                  ? AppColors.bodyFontDark
                  : AppColors.textFeildDark,
              tabs: [
                Tab(text: "Notifincations"),
                Tab(text: "Add Notifincation"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildNotificationsTab(context),
                  _buildAddNotificationTab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============= تبويب عرض الإشعارات =============
  Widget _buildNotificationsTab(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => notifController.fetchNotifications(),
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const SizedBox(height: 25),
            Obx(() {
              if (notifController.isLoading.value) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (notifController.notifications.isEmpty) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                        child: Text(
                          "لا توجد إشعارات حاليًا",style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.bodyFontDark
                              : AppColors.textFeildDark,
                        ),
                        ),
                    ),
                );
              }

              return Column(
                children: notifController.notifications.map((n) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: NotifincationCard(
                      bottom: "viwe",
                      title: n.title,
                      conict: n.content,
                      icon: Icons.volume_up,
                      height: 100,
                      width: 200,
                      date: n.date,
                    ),
                  );
                }).toList(),
              );
            }),
                  const SizedBox(height: 100),
                ],
            ),
        ),
    );
  }

  // ============= تبويب إضافة إشعار =============
  Widget _buildAddNotificationTab(BuildContext context) {
    return SingleChildScrollView(
        child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
            const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Notifincatin Cration",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.tecnotfincatinDark
                  : AppColors.primaryLight,
              fontSize: 30,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "add new notfincation for ehter student or class.",
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.bodyFontDark
                  : AppColors.labelFontLight,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/Gemini_Generated_Image_dli9x8dli9x8dli9.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 30),
        CustomTextField(
          controller: addController.titleController,
          label: "notifincation title",
          hintText: "the title of notifincation title bold..",
        ),
        const SizedBox(height: 30),
        CustomTextField(
          controller: addController.conectController,
          label: "Discrabtion",
          hintText: "the title of notifincation title bold..",
          maxLines: 5,
        ),
        const SizedBox(height: 30),
        Obx(() => CustomDropdown<String>(
          label: "Grade",
          hintText: "اختر الصف",
          value: addController.selectedGrade.value,
          items: addController.grades,
          itemLabel: (grade) => grade,
          onChanged: (value) {
            addController.selectedGrade.value = value;
            if (value != null) {
              addController.loadStudents(value);
            }
          },
        )),
        const SizedBox(height: 16),
        Obx(() => CustomDropdown<String>(label: "student",
          hintText: "اختر الطالب",
          value: addController.selectedStudent.value,
          items: addController.students,
          itemLabel: (grade) => grade,
          onChanged: (value) {
            addController.selectedStudent.value = value;
          },
        )),
              const SizedBox(height: 60),
              Obx(
                    () => addController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : NextButton(
                  onTap: () => addController.addnotifincation(),
                ),
              ),
              const SizedBox(height: 40),
            ],
        ),
    );
  }
}