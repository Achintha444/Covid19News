import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../entities/covid_all.dart';
import '../repos/covid_repo.dart';

class GetAllCovidInfo implements UseCase<CovidAll, NoParams> {
  CovidRepo _repo;

  GetAllCovidInfo({@required CovidRepo repo}) {
    this._repo = repo;
  }

  @override
  Future<Either<Faliure, CovidAll>> call(NoParams params) async {
    return await this._repo.getAllCovidInfo();
  }
}
