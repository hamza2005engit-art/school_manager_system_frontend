import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_project1/core/database/database_helper.dart';

import '../../../../core/theme/app_fonts.dart';
import '../../../../core/widget/CustomappBar.dart';
import '../../../../core/widget/customBottomNavigatorBar.dart';
import '../../../../routes/app_routes.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {

  bool isDark = false;

  final SqlDb sqlDb = SqlDb();

  List<Map> pendingTasks = [];
  List<Map> completedTasks = [];

  String selectedFilter = "All";

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    final pending = await sqlDb.getPendingTasks();
    final completed = await sqlDb.getCompletedTasks();

    setState(() {
      pendingTasks = pending;
      completedTasks = completed;
    });
  }

  List<Map> get filteredTasks {
    if (selectedFilter == "Pending") return pendingTasks;
    if (selectedFilter == "Completed") return completedTasks;
    return [...pendingTasks, ...completedTasks];
  }

  Future<void> toggleComplete(Map task) async {
    await sqlDb.toggleTaskCompleted(task['id'], task['isCompleted']);
    fetchTasks();
  }

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
    });
  }
  final role = (GetStorage().read('role') ?? '').toString();
  final name = GetStorage().read('name') ?? '';

  @override
  Widget build(BuildContext context) {
    final bgColor =
    isDark ? const Color(0xFF0D0D1F) : const Color(0xFFF5F5F7);

    final headerColor =
    isDark ? const Color(0xFF5B7CFA) : const Color(0xFF1F3A93);

    final cardColor =
    isDark ? const Color(0xFF3A3A6B) : Colors.white;

    final textColor =
    isDark ? Colors.white : Colors.black87;

    final completedCardColor =
    isDark ? const Color(0xFF2C2C42) : const Color(0xFFE5E5E8);

    return Scaffold(
      drawer: Drawer(),
      appBar: CustomAppBar(name: name,),
      bottomNavigationBar: CustomBottomNavigator(
        currentIndex: role == 'admin' ? 2 : 3,
        onTap: (index) {
          if(role == 'student' || role == 'teacher') {
            if (index == 0) {
              if(role=='teacher') {
                Get.toNamed(Routes.STUDENTSFORTEACHER);
              } else {
                Get.offNamed(Routes.MARKS);}
            }
            if (index == 1) {
              Get.offNamed(Routes.SCHEDULE);
            }
            if(index == 2) {
              Get.toNamed(Routes.Home1);
            }
            if (index == 4) {
              Get.offNamed(Routes.PROFILE);
            }
          } else {
            if(index == 0) {
              Get.offNamed(Routes.StudentManagmetAdmin);
            }
            if(index == 1) {
              Get.toNamed(Routes.Home1);
            }
            if(index == 3)  {
              Get.toNamed(Routes.PROFILE);
            }
          }
        },
        bottomNavigatorBarItem: [
          BottomNavigationBarItem(
            icon: Icon(
                role == 'teacher' || role == 'admin' ?
                Icons.groups: Icons.assignment_turned_in),
            label: role == 'teacher' || role == 'admin' ?'Students' : 'Marks',
          ),
          if(role == 'student' || role == 'teacher')
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Schedule',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      backgroundColor: bgColor,

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF5B7CFA),
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: SafeArea(
        child: Column(
          children: [

            /// HEADER
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.symmetric(
            //       horizontal: 16, vertical: 18),
            //   decoration: BoxDecoration(
            //     color: headerColor,
            //     borderRadius: const BorderRadius.only(
            //       bottomLeft: Radius.circular(24),
            //       bottomRight: Radius.circular(24),
            //     ),
            //   ),
            //   child: Row(
            //     children: [
            //       const Icon(Icons.assignment, color: Colors.white),
            //
            //       const SizedBox(width: 12),
            //
            //       const Text(
            //         "Tasks",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 24,
            //             fontWeight: FontWeight.bold),
            //       ),
            //
            //       const Spacer(),
            //
            //       IconButton(
            //         onPressed: toggleTheme,
            //         icon: const Icon(Icons.brightness_6,
            //             color: Colors.white),
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(height: 16),

            Text(
              "Pending ${pendingTasks.length} • Completed ${completedTasks.length}",
              style: TextStyle(color: textColor),
            ),

            const SizedBox(height: 16),

            /// FILTERS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _FilterButton(
                      label: "All",
                      selected: selectedFilter == "All",
                      isDark: isDark,onTap: () {
                      setState(() => selectedFilter = "All");
                    },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _FilterButton(
                      label: "Pending",
                      selected: selectedFilter == "Pending",
                      isDark: isDark,
                      onTap: () {
                        setState(() => selectedFilter = "Pending");
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _FilterButton(
                      label: "Completed",
                      selected: selectedFilter == "Completed",
                      isDark: isDark,
                      onTap: () {
                        setState(() => selectedFilter = "Completed");
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: filteredTasks.isEmpty
                  ? Center(
                child: Text("لا توجد مهام",
                    style: TextStyle(color: textColor)),
              )
                  : ListView.builder(
                padding:
                const EdgeInsets.symmetric(horizontal: 16),
                itemCount: filteredTasks.length,
                itemBuilder: (context, index) {
                  final task = filteredTasks[index];

                  return _TaskCard(
                    task: task,
                    cardColor: task["isCompleted"] == 1
                        ? completedCardColor
                        : cardColor,
                    textColor: textColor,
                    onToggle: () => toggleComplete(task),
                    onEdit: () => _showEditDialog(task),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ADD TASK
  void _showAddDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    final dueCtrl = TextEditingController();
    String priority = "High";

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setDialog) {
            return AlertDialog(
              title: const Text("إضافة مهمة"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleCtrl,
                    decoration:
                    const InputDecoration(labelText: "العنوان"),
                  ),
                  TextField(
                    controller: dueCtrl,
                    decoration:
                    const InputDecoration(labelText: "التاريخ"),
                  ),
                  DropdownButton<String>(
                    value: priority,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(value: "High", child: Text("High")),
                      DropdownMenuItem(value: "Mid", child: Text("Mid")),
                      DropdownMenuItem(value: "Low", child: Text("Low")),
                    ],
                    onChanged: (v) {
                      setDialog(() => priority = v!);
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text("إلغاء")),

                ElevatedButton(
                  onPressed: () async {
                    await sqlDb.addTask(
                      title: titleCtrl.text,
                      priority: priority,
                      dueDate: dueCtrl.text,
                    );Navigator.pop(ctx);
                    fetchTasks();
                  },
                  child: const Text("إضافة"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  /// EDIT TASK
  void _showEditDialog(Map task) {
    final titleCtrl =
    TextEditingController(text: task['title']);
    final dueCtrl =
    TextEditingController(text: task['dueDate']);
    String priority = task['priority'];

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setDialog) {
            return AlertDialog(
              title: const Text("تعديل المهمة"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(controller: titleCtrl),
                  TextField(controller: dueCtrl),
                  DropdownButton<String>(
                    value: priority,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(value: "High", child: Text("High")),
                      DropdownMenuItem(value: "Mid", child: Text("Mid")),
                      DropdownMenuItem(value: "Low", child: Text("Low")),
                    ],
                    onChanged: (v) {
                      setDialog(() => priority = v!);
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text("إلغاء")),
                ElevatedButton(
                  onPressed: () async {
                    await sqlDb.updateTask(
                      id: task['id'],
                      title: titleCtrl.text,
                      priority: priority,
                      dueDate: dueCtrl.text,
                    );

                    Navigator.pop(ctx);
                    fetchTasks();
                  },
                  child: const Text("حفظ"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

/// FILTER BUTTON
class _FilterButton extends StatelessWidget {
  final String label;
  final bool selected;
  final bool isDark;
  final VoidCallback onTap;

  const _FilterButton({
    required this.label,
    required this.selected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF00C896)
              : (isDark
              ? const Color(0xFF3A3A6B)
              : Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : (isDark ? Colors.white : Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}

/// TASK CARD
class _TaskCard extends StatelessWidget {
  final Map task;
  final Color cardColor;
  final Color textColor;
  final VoidCallback onToggle;
  final VoidCallback onEdit;

  const _TaskCard({
    required this.task,
    required this.cardColor,
    required this.textColor,
    required this.onToggle,
    required this.onEdit,
  });

  Color getPriorityColor(String priority) {
    switch (priority) {
      case "High":
        return Colors.red;
      case "Mid":
        return Colors.orange;
      case "Low":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isCompleted = task['isCompleted'] == 1;

    final priority = task['priority'] ?? "Low";
    final dueDate = task['dueDate'] ?? "-";

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border(
          left: BorderSide(
            color: getPriorityColor(priority),
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
          Text(
            task['title'] ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: isCompleted ? Colors.grey : textColor,
            ),
          ),

          const SizedBox(height: 8),

          /// PRIORITY + DATE
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(

                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: getPriorityColor(priority).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  priority,
                  style: TextStyle(
                    color: getPriorityColor(priority),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              const Icon(Icons.calendar_today,
                  size: 14, color: Colors.grey),

              const SizedBox(width: 4),

              Text(
                dueDate,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// ACTIONS
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit, color: Colors.blue),
              ),
              IconButton(
                onPressed: onToggle,
                icon: Icon(
                  isCompleted
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: isCompleted ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}