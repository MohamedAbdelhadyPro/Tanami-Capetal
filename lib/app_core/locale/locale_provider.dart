import 'package:flutter/material.dart';
import 'package:tanami_capital_task/app_core/storage/storage_repo.dart';

import '../di/di.dart';

class LocaleProvider extends ChangeNotifier {
  Locale locale = Locale("en");

  init() async {
    if (await di<StorageRepo>().isContains("language")) {
      String? lang = await di<StorageRepo>().read("language");
      if (lang != null) {
        locale = Locale(lang);
      }
    }
  }

  changeLanguage({String? language}) {
    if (language == null) {
      if (locale.languageCode == "ar") {
        locale = Locale("en");
      } else {
        locale = Locale("ar");
      }
    } else {
      locale = Locale(language);
    }
    di<StorageRepo>().write(key: "language", value: locale.languageCode);
    notifyListeners();
  }
}
