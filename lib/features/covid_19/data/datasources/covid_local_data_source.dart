import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/Error/exceptions.dart';
import '../models/covid_all_model.dart';
import '../models/covid_country_model.dart';

abstract class CovidLocalDataSource {
  /// Throws a [CacheException] for all error codes.
  Future<CovidCountryModel> getLastCountrySpecifiCovidInfo();

  /// Throws a [CacheException] for all error codes.
  Future<CovidAllModel> getLastAllCovidInfo();

  Future<void> cacheAllCovidInfo(CovidAllModel covidAllModel);

  Future<void> cacheCountrySpecifiCovidInfo(CovidCountryModel countryModel);
}

class CovidLocalDataSourceImpl implements CovidLocalDataSource {
  SharedPreferences _sharedPreferences;

  CovidLocalDataSourceImpl({@required SharedPreferences sharedPreferences}) {
    this._sharedPreferences = sharedPreferences;
  }

  @override
  Future<void> cacheAllCovidInfo(CovidAllModel covidAllModel) {
    return this._sharedPreferences.setString(
          'CACHED_COVID_ALL',
          json.encode(
            covidAllModel.toJson(),
          ),
        );
  }

  @override
  Future<void> cacheCountrySpecifiCovidInfo(CovidCountryModel countryModel) {
    return this._sharedPreferences.setString(
          'CACHED_COVID_COUNTRY',
          json.encode(
            countryModel.toJson(),
          ),
        );
  }

  @override
  Future<CovidAllModel> getLastAllCovidInfo() {
    final String jsonCovidAll =
        this._sharedPreferences.getString('CACHED_COVID_ALL');
    if (jsonCovidAll != null) {
      return Future.value(
        CovidAllModel.fromJson(
          json.decode(jsonCovidAll),
        ),
      );
    } else {
      //There is an error in throwing this error!
      throw CacheException();
    }
  }

  @override
  Future<CovidCountryModel> getLastCountrySpecifiCovidInfo() {
    final String jsonCovidCountry =
        this._sharedPreferences.getString('CACHED_COVID_COUNTRY');
    if (jsonCovidCountry != null) {
      return Future.value(
        CovidCountryModel.fromJson(
          json.decode(jsonCovidCountry),
        ),
      );
    } else {
      //There is an error in throwing this error!
      throw CacheException();
    }
  }
}
