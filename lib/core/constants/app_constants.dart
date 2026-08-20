class AppConstants {
  // 1. إعدادات الـ API (الربط مع Laravel)
  static const String baseUrl = "https://darkseagreen-salamander-685564.hostingersite.com/api/v1"; // استخدم هذا العنوان لمحاكي أندرويد
  static const int requestTimeout = 30000; // 30 ثانية

  // 2. مفاتيح التخزين المحلي (Local Storage)
  static const String tokenKey = "user_token";
  static const String userKey = "user_data";
  static const String isFirstRun = "is_first_run";

  // 3. نصوص عامة (UI Strings)
  static const String appName = "EduFlow";
  static const String defaultErrorMessage = "Something went wrong, please try again.";
  static const String noInternetMessage = "Check your internet connection.";

  // 4. إعدادات الـ Validation
  static const int minPasswordLength = 8;
  static const int phoneLength = 10;

  // 5. المسارات الافتراضية (Assets)
  static const String logoPath = "assets/images/Stylized _SchoolManage_ logo design.png";
  static const String placeholderImage = "assets/images/placeholder.png";
}