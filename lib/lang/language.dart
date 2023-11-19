import 'package:get/get.dart';
import 'translations/en_us.dart';
import 'translations/my_mm.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ...EnUSTranslations().keys,
        ...MyMMTranslations().keys,
      };
}
