import 'package:get/get.dart';
import 'package:student_project1/features/about-us/aboutUs.dart';
import 'package:student_project1/features/auth/presentation/screens/forgetpassword_screen.dart';
import 'package:student_project1/features/auth/presentation/screens/hellomogeh_screen.dart';
import 'package:student_project1/features/auth/presentation/screens/hellotecher_screen.dart';
import 'package:student_project1/features/auth/presentation/screens/logIn_screen.dart';
import 'package:student_project1/features/exercise/presentaion/bindings/exercises_binding.dart';
import 'package:student_project1/features/exercise/presentaion/screens/all_exercise.dart';
import 'package:student_project1/features/exercise/presentaion/screens/exercise.dart';
import 'package:student_project1/features/home/presentation/bindings/home_binding.dart';
import 'package:student_project1/features/home/presentation/screens/home_screen.dart';
import 'package:student_project1/features/home/presentation/screens/marks_student_screen.dart';
import 'package:student_project1/features/home/presentation/screens/notifincation_screen.dart';
import 'package:student_project1/features/home/presentation/screens/task_screen.dart';
import 'package:student_project1/features/library/presentation/bindings/library_bindings.dart';
import 'package:student_project1/features/library/presentation/screens/library_school_screen.dart';
import 'package:student_project1/features/library/presentation/screens/library_screen.dart';
import 'package:student_project1/features/navigation/navigation_binding.dart';
import 'package:student_project1/features/navigation/navigation_widget.dart';
import 'package:student_project1/features/profile/presentation/bindings/profile_binding.dart';
import 'package:student_project1/features/profile/presentation/screens/profile.dart';
import 'package:student_project1/features/schedule/presentation/bindings/schedule_binding.dart';
import 'package:student_project1/features/schedule/presentation/screens/schedule.dart';
import 'package:student_project1/features/student_details/presentation/screens/student_details.dart';
import 'package:student_project1/features/student_management/presentation/screen/student_management.dart';
import 'package:student_project1/features/student_managment_admin/presentation/bindings/student_managment_admin_binding.dart';
import 'package:student_project1/features/student_managment_admin/presentation/screens/student_managment_admin.dart';
import 'package:student_project1/routes/app_routes.dart';
import 'package:student_project1/features/auth/presentation/bindings/auth_binding.dart';
import '../features/auth/presentation/screens/first_forgetpassword_screen.dart';
import '../features/auth/presentation/screens/firstregister_screen.dart';
import '../features/auth/presentation/screens/hellostudent_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/sepalsh_screen.dart';
import '../features/exercises _for_student/presentation/bindings/exercises_for_student_binding.dart';
import '../features/exercises _for_student/presentation/screens/exercises _for_student.dart';
import '../features/home/presentation/screens/fees_screen.dart';
import 'package:student_project1/features/home_page/presentation/screens/home_screen.dart' hide HomeScreen;

import '../features/home_page/presentation/bindings/get_statisctics_bindings.dart';
import '../features/student_details/presentation/bindings/student_binding.dart';
import '../features/student_management/presentation/bindings/student_mangment_bindings.dart';

class AppPages {
  // تحديد الصفحة الابتدائية للتطبيق
  static const String INITIAL = Routes.NOTIFICATION;

  static final List<GetPage> routes = [

    ///auth
    GetPage(
      name: Routes.LOGIN,
      page: () => const LogInScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn, // تأثير الانتقال بين الصفحات
    ),
    GetPage(
      name: Routes.SEPLASH,
      page: () => const SplashScreen (),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: Routes.HELLO3,
      page: () => const HellomogehScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.HELLO2,
      page: () => const HellotecherScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.HELLO1,
      page: () => const HellostudentScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.REGISTER1,
      page: () => const FirstRegisterScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.REGISTER2,
      page: () => const RegisterScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.FORGETPASSWORD,
      page: () => const ForgetpasswordScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.FirstFORGETPASSWORD,
      page: () => const FirstForgetpasswordScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),

    ////Home
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotifincationScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.MARKS,
      page: () => const MarksStudentScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.FEES,
      page: () => const FeesScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    //2
    GetPage(
        name: Routes.Home1,
        page: ()=> HomeScreenMain(),
      binding: GetStatiscticsBinding(),

    ),
    GetPage(
        name: Routes.SCHEDULE,
        page: ()=>Schedule(),
      binding: ScheduleBinding(),
      transition: Transition.fadeIn
    ),
    GetPage(
        name: Routes.PROFILE,
        page: ()=>Profile(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn
    ),
    GetPage(
        name: Routes.STUDENTSFORSUPERVISOR,
        page: ()=>StudentManagement(),
      transition: Transition.fadeIn
    ),
    GetPage(
        name: Routes.About,
        page: ()=>AboutUs(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: Routes.Exercise,
        page: ()=>Exercise(),
      transition: Transition.fadeIn
    ),
    GetPage(
        name: Routes.AllExercise,
        page: ()=>AllExercise(),
        binding: ExercisesBindings(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: Routes.LIBRARY,
        page: ()=>LibraryScreen(),
        binding: LibraryBinding(),
      transition: Transition.fadeIn
    ),
    GetPage(
        name: Routes.STUDENTDETAILS,
        page: ()=>StudentDetails(),
      binding: StudentBinding()
    ),
    GetPage(
        name: Routes.StudentManagmetAdmin,
        page: ()=>StudentManagmentAdmin(),
       binding: StudentManagmentAdminBindings(),
       transition: Transition.fadeIn,
    ),
    GetPage(
        name: Routes.ADDEXERCISE,
        page: ()=>Exercise(),
      binding: ExercisesBindings(),
      transition: Transition.fadeIn
    ),
    GetPage(
        name: Routes.STUDENTSFORTEACHER,
        page: ()=>StudentManagement(),
      binding: StudentMangmentBinding(),
      transition: Transition.fadeIn
    ),
    GetPage(
        name: Routes.EXERCISEFORSTUDENT,
        page: ()=>ExercisesForStudent(),
      binding: ExercisesForStudentBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: Routes.TASK,
        page:()=> TasksView(),
    )

  ];
}
