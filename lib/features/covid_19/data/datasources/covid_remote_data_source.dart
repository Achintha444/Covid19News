import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Error/exceptions.dart';
import '../models/covid_all_model.dart';
import '../models/covid_country_model.dart';

abstract class CovidRemoteDataSource {
  /// Calls https://corona.lmao.ninja/countries/all endpoint
  ///
  ///  Throws a [ServerException] for Server Errors
  Future<CovidAllModel> getAllCovidInfo();

  /// Calls https://corona.lmao.ninja/countries/{country} and http://restcountries.eu/rest/v2/name/{country} endpoints
  ///
  ///  Throws a [ServerException] for Server Errors
  ///  Throws [CountryNotFoundException] for wrong inputs
  Future<CovidCountryModel> getCountrySpecifiCovidInfo(String country);
}

class CovidRemoteDataSourceImpl implements CovidRemoteDataSource {
  http.Client _httpClient;

  CovidRemoteDataSourceImpl({@required http.Client httpClient}) {
    this._httpClient = httpClient;
  }

  @override
  Future<CovidAllModel> getAllCovidInfo() async {
    final response =
        await this._httpClient.get('https://corona.lmao.ninja/all');
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      return CovidAllModel.fromJson(
        json.decode(response.body),
      );
    }
  }

  @override
  Future<CovidCountryModel> getCountrySpecifiCovidInfo(String country) async {
    final responseCovid = await this
        ._httpClient
        .get('https://corona.lmao.ninja/countries/$country');

    if ((responseCovid.statusCode != 200)) {
      throw ServerException();
    } else {
      try {
        return CovidCountryModel.fromJson(
          json.decode(responseCovid.body)
        );
      } on Exception {
        throw CountryNotFoundException();
      }
    }
  }
}
