import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Error/exceptions.dart';
import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../domain/entities/covid_all.dart';
import '../../domain/entities/covid_country.dart';
import '../../domain/repos/covid_repo.dart';
import '../datasources/covid_local_data_source.dart';
import '../datasources/covid_remote_data_source.dart';

class CovidRepoImpl implements CovidRepo {
  CovidRemoteDataSource _covidRemoteDataSource;
  CovidLocalDataSource _covidLocalDataSource;
  NetworkInfo _networkInfo;

  CovidRepoImpl(
      {@required CovidRemoteDataSource covidRemoteDataSource,
      @required CovidLocalDataSource covidLocalDataSource,
      @required NetworkInfo networkInfo}) {
    this._covidLocalDataSource = covidLocalDataSource;
    this._covidRemoteDataSource = covidRemoteDataSource;
    this._networkInfo = networkInfo;
  }

  @override
  Future<Either<Faliure, CovidAll>> getAllCovidInfo() async {
    if (await _networkInfo.isConnected) {
      try {
        final _finalCovidAllModel =
            await _covidRemoteDataSource.getAllCovidInfo();
        await _covidLocalDataSource.cacheAllCovidInfo(_finalCovidAllModel);
        return Right(_finalCovidAllModel);
      } on ServerException {
        return (Left(ServerFaliure()));
      }
    } else {
      try {
        final _finalCovidAllModel =
            await _covidLocalDataSource.getLastAllCovidInfo();
        return Right(_finalCovidAllModel);
      } on CacheException {
        return (Left(CacheFaliure()));
      }
    }
  }

  @override
  Future<Either<Faliure, CovidCountry>> getCountrySpecifiCovidInfo(
      String country) async {
   if (await _networkInfo.isConnected) {
      try {
        final _finalCovidCountryModel =
            await _covidRemoteDataSource.getCountrySpecifiCovidInfo(country);
        await _covidLocalDataSource.cacheCountrySpecifiCovidInfo(_finalCovidCountryModel);
        return Right(_finalCovidCountryModel);
      } on ServerException {
        return (Left(ServerFaliure()));
      }
    } else {
      try {
        final _finalCovidCountryModel =
            await _covidLocalDataSource.getLastCountrySpecifiCovidInfo();
        return Right(_finalCovidCountryModel);
      } on CacheException {
        return (Left(CacheFaliure()));
      }
    }
  }

  @override
  Future<Either<Faliure, CovidCountry>> getLKSpecifiCovidInfo() {
    return this.getCountrySpecifiCovidInfo('Sri Lanka');
  }
}
