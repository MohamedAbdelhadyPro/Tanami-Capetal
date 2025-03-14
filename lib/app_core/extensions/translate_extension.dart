import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_strings.dart';

extension TranslateExtension on BuildContext {
  /// Returns an instance of AppStrings to access the localized strings.
  AppStrings get tr => AppStrings.of(this);
}
