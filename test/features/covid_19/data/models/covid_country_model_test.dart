import 'dart:convert';

import 'package:covid_19_info/features/covid_19/data/models/covid_country_model.dart';
import 'package:covid_19_info/features/covid_19/domain/entities/covid_country.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final String imageUrl = 'https://restcountries.eu/data/usa.svg';
  final String country = 'Sri Lanka';
  final int cases = 66;
  final int deaths = 0;
  final int recovered = 3;
  final int todayDeaths = 0;
  final int active = 63;
  final int critical = 0;
  final int casesPerOneMillion = 3;

  final tCovidAll = CovidCountryModel(
    cases: cases,
    deaths: deaths,
    recovered: recovered,
    active: active,
    casesPerOneMillion: casesPerOneMillion,
    country: country,
    critical: critical,
    imageUrl: imageUrl,
    todayDeaths: todayDeaths,
  );

  test(
    'should be a subclass of CovidAll',
    () async {
      //assert
      expect(tCovidAll, isA<CovidCountry>());
    },
  );

  //* fromJson()
  test(
    'should return CovidAllModel when fromJson() called',
    () async {
      //arrange
      final Map<String, dynamic> jsonMapCovidCountry = json.decode(
        fixtureReader('covid_country.json'),
      );
      //act
      final result =
          CovidCountryModel.fromJson(jsonMapCovidCountry);
      //assert
      expect(result, equals(tCovidAll));
    },
  );

  //* toJson()
  test(
    'should return a JSON map when toJson() called',
    () async {
      //act
      final result = tCovidAll.toJson();
      //assert
      final expectedMap = {
        "imageUrl": 'https://restcountries.eu/data/usa.svg',
        "country": 'Sri Lanka',
        "cases": 66,
        "deaths": 0,
        "recovered": 3,
        "todayDeaths": 0,
        "active": 63,
        "critical": 0,
        "casesPerOneMillion": 3,
      };
      expect(result, expectedMap);
    },
  );
}
