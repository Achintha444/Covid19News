import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../entities/covid_country.dart';
import '../repos/covid_repo.dart';

class GetCountrySpecifiCovidInfo implements UseCase<CovidCountry, String> {
  CovidRepo _repo;

  GetCountrySpecifiCovidInfo({@required CovidRepo repo}) {
    this._repo = repo;
  }

  @override
  Future<Either<Faliure, CovidCountry>> call(String country) async {
    return this._repo.getCountrySpecifiCovidInfo(country);
  }
}
