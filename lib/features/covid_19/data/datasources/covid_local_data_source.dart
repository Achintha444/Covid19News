import '../../domain/entities/covid_country.dart';
import '../models/covid_all_model.dart';

abstract class CovidLocalDataSource{
  /// Throws a [CacheException] for all error codes.
  Future<CovidCountry> getLastCountrySpecifiCovidInfo();

  Future<void> cacheAllCovidInfo(CovidAllModel covidAllModel);

  Future<void> cacheCountrySpecifiCovidInfo(CovidCountryModel countryModel);
}