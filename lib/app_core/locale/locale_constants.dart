import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_strings.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

List<Locale> supportedLocale = [
  const Locale.fromSubtags(
    languageCode: 'en',
    countryCode: 'US',
  ),
  const Locale.fromSubtags(
    languageCode: 'ar',
    countryCode: 'EG',
  ),
];

List<LocalizationsDelegate<dynamic>> localizationDelegates = [
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
  DefaultCupertinoLocalizations.delegate,
  AppStrings.delegate,
];
