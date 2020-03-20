import '../models/covid_all_model.dart';
import '../models/covid_country_model.dart';

abstract class CovidRemoteDataSource {
  /// Calls https://corona.lmao.ninja/countries/all endpoint
  ///
  ///  Throws a [ServerException] for all error codes.
  Future<CovidAllModel> getAllCovidInfo();

  /// Calls https://corona.lmao.ninja/countries/{country} and http://restcountries.eu/rest/v2/name/{country} endpoints
  ///
  ///  Throws a [ServerException] for all error codes.
  Future<CovidCountryModel> getCountrySpecifiCovidInfo(String country);

}
