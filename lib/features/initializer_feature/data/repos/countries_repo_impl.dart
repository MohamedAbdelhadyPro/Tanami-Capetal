import 'package:multiple_result/src/result.dart';

import '../../../../app_core/unit/failures.dart';
import '../fake_data/country_list.dart';
import '../respone_models/country_model.dart';
import 'countries_repo.dart';

class CountriesRepoImpl implements CountriesRepo {
  @override
  Future<Result<List<CountryModel>, Failure>> getCountryList() async {
    return Success(getAvailableCountries());
  }
}
