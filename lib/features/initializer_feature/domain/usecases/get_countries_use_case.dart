import 'package:multiple_result/multiple_result.dart';
import 'package:tanami_capital_task/features/initializer_feature/data/repos/countries_repo.dart';

import '../../../../app_core/unit/failures.dart';
import '../../../../app_core/unit/usecase.dart';
import '../../data/respone_models/country_model.dart';

class GetCountriesUseCase extends UseCase<List<CountryModel>, NoParams> {
  GetCountriesUseCase({required this.countriesRepo});
  final CountriesRepo countriesRepo;

  @override
  Future<Result<List<CountryModel>, Failure>> call(NoParams params) async {
    return await countriesRepo.getCountryList();
  }
}
