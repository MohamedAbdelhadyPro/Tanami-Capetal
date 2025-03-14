import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/routes/nav_service.dart';
import 'package:tanami_capital_task/features/initializer_feature/data/respone_models/country_model.dart';

import '../../../../app_core/di/di.dart';

List<CountryModel> getAvailableCountries() {
  final context = di<NavService>().navKey.currentContext!;
  return [
    CountryModel(
      name: context.tr.bahrain,
      iso: "+973",
      id: "6",
      isoName: "BH",
      flag: "🇧🇭",
    ),
    CountryModel(
      name: context.tr.egypt,
      iso: "+20",
      id: "1",
      isoName: "EG",
      flag: "🇪🇬",
    ),
    CountryModel(
      name: context.tr.saudiArabia,
      iso: "+966",
      id: "2",
      isoName: "SA",
      flag: "🇸🇦",
    ),
    CountryModel(
      name: context.tr.qatar,
      iso: "+974",
      id: "3",
      isoName: "QA",
      flag: "🇶🇦",
    ),
    CountryModel(
      name: context.tr.kuwait,
      iso: "+965",
      id: "4",
      isoName: "KW",
      flag: "🇰🇼",
    ),
    CountryModel(
      name: context.tr.uae,
      iso: "+971",
      id: "5",
      isoName: "AE",
      flag: "🇦🇪",
    ),
    CountryModel(
      name: context.tr.oman,
      iso: "+968",
      id: "7",
      isoName: "OM",
      flag: "🇴🇲",
    ),
  ];
}
