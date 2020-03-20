import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../domain/entities/covid_all.dart';
import '../../domain/entities/covid_country.dart';
import '../../domain/repos/covid_repo.dart';
import '../datasources/covid_local_data_source.dart';
import '../datasources/covid_remote_data_source.dart';

class CovidRepoImpl implements CovidRepo{

  CovidRemoteDataSource _covidRemoteDataSource;
  CovidLocalDataSource _covidLocalDataSource;
  NetworkInfo _networkInfo;

  CovidRepoImpl({@required CovidRemoteDataSource covidRemoteDataSource, @required CovidLocalDataSource covidLocalDataSource, @required NetworkInfo networkInfo}){
    this._covidLocalDataSource = covidLocalDataSource;
    this._covidRemoteDataSource = covidRemoteDataSource;
    this._networkInfo = networkInfo;
  }

  @override
  Future<Either<Faliure, CovidAll>> getAllCovidInfo() {
    // TODO: implement getAllCovidInfo
    return null;
  }

  @override
  Future<Either<Faliure, CovidCountry>> getCountrySpecifiCovidInfo(String country) {
    // TODO: implement getCountrySpecifiCovidInfo
    return null;
  }

  @override
  Future<Either<Faliure, CovidCountry>> getLKSpecifiCovidInfo() {
    // TODO: implement getLKSpecifiCovidInfo
    return null;
  }
  
}