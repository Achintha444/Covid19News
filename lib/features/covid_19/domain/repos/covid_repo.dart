import 'package:dartz/dartz.dart';

import '../../../../core/Error/Faliure.dart';
import '../entities/covid_all.dart';
import '../entities/covid_country.dart';

abstract class CovidRepo {
  Future<Either<Faliure,CovidAll>> getAllCovidInfo();
  Future<Either<Faliure,CovidCountry>> getCountrySpecifiCovidInfo(String country);
  Future<Either<Faliure,CovidCountry>> getLKSpecifiCovidInfo();
}