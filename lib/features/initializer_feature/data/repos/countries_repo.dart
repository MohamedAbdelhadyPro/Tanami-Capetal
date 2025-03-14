import 'package:multiple_result/multiple_result.dart';
import 'package:tanami_capital_task/features/initializer_feature/data/respone_models/country_model.dart';

import '../../../../app_core/unit/failures.dart';

abstract class CountriesRepo {
  Future<Result<List<CountryModel>, Failure>> getCountryList();
}
