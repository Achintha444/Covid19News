import 'package:dartz/dartz.dart';

abstract class CovidRepo {
  Future<Either<Faliure,CovidAll>> getAllCovidInfo();
  Future<Either<Faliure,CovidCountry>> getCountrySpecifiCovidInfo();
  Future<Either<Faliure,CovidCountry>> getLKSpecifiCovidInfo();
}