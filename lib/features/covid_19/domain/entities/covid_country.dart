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
  num _cases;
  num _deaths;
  num _todayDeaths;
  num _recovered;
  num _active;
  num _critical;
  num _casesPerOneMillion;
  num _todayCases;

  CovidCountry({
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

  num get getCases {
    return this._cases;
  }

  num get getDeaths {
    return this._deaths;
  }

  num get getTodayDeaths {
    return this._todayDeaths;
  }

  num get getRecovered {
    return this._recovered;
  }

  num get getActive {
    return this._active;
  }

  num get getCritical {
    return this._critical;
  }

  num get getCasesPerOneMillion {
    return this._casesPerOneMillion;
  }

  num get getTodayCases{
    return this._todayCases;
  }

}
