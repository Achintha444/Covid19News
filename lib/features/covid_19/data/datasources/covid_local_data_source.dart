import '../models/covid_all_model.dart';
import '../models/covid_country_model.dart';

abstract class CovidLocalDataSource {
  /// Throws a [CacheException] for all error codes.
  Future<CovidCountryModel> getLastCountrySpecifiCovidInfo();

  Future<CovidAllModel> getLastAllCovidInfo();

  Future<void> cacheAllCovidInfo(CovidAllModel covidAllModel);

  Future<void> cacheCountrySpecifiCovidInfo(CovidCountryModel countryModel);
}
