/* {"country":"Sri Lanka",
"cases":66,
"todayCases":6,
"deaths":0,
"todayDeaths":0,
"recovered":3,
"active":63,
"critical":0,
"casesPerOneMillion":3}*/

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CovidCountry extends Equatable {
  String _imageUrl;
  String _country;
  int _cases;
  int _deaths;
  int _todayDeaths;
  int _recovered;
  int _active;
  int _critical;
  int _casesPerOneMillion;
  int _todayCases;

  CovidCountry({
    @required String imageUrl,
    @required String country,
    @required int cases,
    @required int todayCases,
    @required int deaths,
    @required int todayDeaths,
    @required int recovered,
    @required int active,
    @required int critical,
    @required int casesPerOneMillion,
  }) : super([
          imageUrl,
          country,
          cases,
          deaths,
          todayDeaths,
          recovered,
          active,
          critical,
          casesPerOneMillion,
          todayCases,
        ]) {
    this._imageUrl = imageUrl;
    this._country = country;
    this._cases = cases;
    this._deaths = deaths;
    this._todayDeaths = todayDeaths;
    this._recovered = recovered;
    this._active = active;
    this._critical = critical;
    this._casesPerOneMillion = casesPerOneMillion;
    this._todayCases = todayCases;
  }

  String get getImageUrl {
    return this._imageUrl;
  }

  String get getCountry {
    return this._country;
  }

  int get getCases {
    return this._cases;
  }

  int get getDeaths {
    return this._deaths;
  }

  int get getTodayDeaths {
    return this._todayDeaths;
  }

  int get getRecovered {
    return this._recovered;
  }

  int get getActive {
    return this._active;
  }

  int get getCritical {
    return this._critical;
  }

  int get getCasesPerOneMillion {
    return this._casesPerOneMillion;
  }

  int get getTodayCases{
    return this._todayCases;
  }

}
