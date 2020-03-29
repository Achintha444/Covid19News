import 'package:flutter/material.dart';

import '../../domain/entities/covid_country.dart';

/* 
{"country":"Sri Lanka",
"cases":66,
"todayCases":6,
"deaths":0,
"todayDeaths":0,
"recovered":3,
"active":63,
"critical":0,
"casesPerOneMillion":3}*/

class CovidCountryModel extends CovidCountry {
  String _imageUrl;
  String _country;
  num _cases;
  num _deaths;
  num _todayDeaths;
  num _recovered;
  num _active;
  num _critical;
  num _casesPerOneMillion;

  CovidCountryModel({
    @required String imageUrl,
    @required String country,
    @required num cases,
    @required num todayCases,
    @required num deaths,
    @required num todayDeaths,
    @required num recovered,
    @required num active,
    @required num critical,
    @required num casesPerOneMillion,
  }) : super(
            imageUrl: imageUrl,
            country: country,
            cases: cases,
            todayCases: todayCases,
            deaths: deaths,
            todayDeaths: todayDeaths,
            recovered: recovered,
            active: active,
            critical: critical,
            casesPerOneMillion: casesPerOneMillion) {
    this._imageUrl = imageUrl;
    this._country = country;
    this._cases = cases;
    this._deaths = deaths;
    this._todayDeaths = todayDeaths;
    this._recovered = recovered;
    this._active = active;
    this._critical = critical;
    this._casesPerOneMillion = casesPerOneMillion;
  }

  // factory CovidCountryModel.fromJson(
  //     Map<String, dynamic> covidCountry, Map<String, dynamic> country) {
  //   return CovidCountryModel(
  //     active: covidCountry['active'],
  //     country: covidCountry['country'],
  //     critical: covidCountry['critical'],
  //     imageUrl: covidCountry['flag'],
  //     casesPerOneMillion: covidCountry['casesPerOneMillion'],
  //     todayDeaths: covidCountry['todayDeaths'],
  //     cases: covidCountry['cases'],
  //     todayCases: covidCountry['todayCases'],
  //     deaths: covidCountry['deaths'],
  //     recovered: covidCountry['recovered'],
  //   );
  // }

  factory CovidCountryModel.fromJson(Map<String, dynamic> covidCountry) {
    return CovidCountryModel(
      active: covidCountry['active'],
      country: covidCountry['country'],
      critical: covidCountry['critical'],
      imageUrl: covidCountry['countryInfo']['flag'],
      casesPerOneMillion: covidCountry['casesPerOneMillion'],
      todayDeaths: covidCountry['todayDeaths'],
      cases: covidCountry['cases'],
      todayCases: covidCountry['todayCases'],
      deaths: covidCountry['deaths'],
      recovered: covidCountry['recovered'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'active': super.getActive,
      'country': super.getCountry,
      'critical': super.getCritical,
      'imageUrl': super.getImageUrl,
      'casesPerOneMillion': super.getCasesPerOneMillion,
      'todayDeaths': super.getTodayDeaths,
      'cases': super.getCases,
      'todayCases': super.getTodayCases,
      'deaths': super.getDeaths,
      'recovered': super.getRecovered,
    };
  }
}
