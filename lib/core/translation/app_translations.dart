import 'package:get/get.dart';
import 'ar_AR.dart';
import 'en_US.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ar_SA': arAR,
  };
}