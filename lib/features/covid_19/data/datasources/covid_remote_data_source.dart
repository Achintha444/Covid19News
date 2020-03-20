import '../../domain/entities/covid_all.dart';
import '../../domain/entities/covid_country.dart';

abstract class CovidRemoteDataSource {
  /// Calls https://corona.lmao.ninja/countries/all endpoint
  ///
  ///  Throws a [ServerException] for all error codes.
  Future<CovidAll> getAllCovidInfo();

  /// Calls https://corona.lmao.ninja/countries/{country} and http://restcountries.eu/rest/v2/name/{country} endpoints
  ///
  ///  Throws a [ServerException] for all error codes.
  Future<CovidCountry> getCountrySpecifiCovidInfo(String country);

  /// Calls https://corona.lmao.ninja/countries/Sri Lanka and http://restcountries.eu/rest/v2/name/Sri Lanka endpoints
  ///
  ///  Throws a [ServerException] for all error codes.
  Future<CovidCountry> getLKSpecifiCovidInfo();
}
