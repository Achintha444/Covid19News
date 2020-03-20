import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../entities/covid_country.dart';
import '../repos/covid_repo.dart';

class GetLKSpecifiCovidInfo implements UseCase<CovidCountry, NoParams> {
  CovidRepo _repo;

  GetLKSpecifiCovidInfo({@required CovidRepo repo}) {
    this._repo = repo;
  }

  @override
  Future<Either<Faliure, CovidCountry>> call(NoParams params) async {
    return this._repo.getLKSpecifiCovidInfo();
  }
}
