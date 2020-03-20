import 'package:covid_19_info/features/covid_19/domain/entities/covid_country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final String imageUrl = 'https://restcountries.eu/data/usa.svg';
  final String country = 'test';
  final int cases = 1;
  final int deaths = 1;
  final int recovered = 1;
  final int todayDeaths = 1;
  final int active = 1;
  final int critical = 1;
  final int casesPerOneMillion = 1;

  final tCovidAll = CovidCountry(
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
  //* getCases
  test(
    'should return same cases provided',
    () async {
      //act
      final result = tCovidAll.getCases;
      //assert
      expect(result, cases);
    },
  );

  //* getDeaths
  test(
    'should return same Deaths provided',
    () async {
      //act
      final result = tCovidAll.getDeaths;
      //assert
      expect(result, deaths);
    },
  );

  //* getRecovered
  test(
    'should return same Recovered provided',
    () async {
      //act
      final result = tCovidAll.getRecovered;
      //assert
      expect(result, recovered);
    },
  );

  //* getActive
  test(
    'should return same Active provided',
    () async {
      //act
      final result = tCovidAll.getActive;
      //assert
      expect(result, active);
    },
  );

  //* getcasesPerOneMillion
  test(
    'should return same casesPerOneMillion provided',
    () async {
      //act
      final result = tCovidAll.getCasesPerOneMillion;
      //assert
      expect(result, casesPerOneMillion);
    },
  );

  //* getcountry
  test(
    'should return same country provided',
    () async {
      //act
      final result = tCovidAll.getCountry;
      //assert
      expect(result, country);
    },
  );

  //* getcritical
  test(
    'should return same critical provided',
    () async {
      //act
      final result = tCovidAll.getCritical;
      //assert
      expect(result, critical);
    },
  );

  //* getimageUrl
  test(
    'should return same imageUrl provided',
    () async {
      //act
      final result = tCovidAll.getImageUrl;
      //assert
      expect(result, imageUrl);
    },
  );

  //* gettodayDeaths
  test(
    'should return same todayDeaths provided',
    () async {
      //act
      final result = tCovidAll.getTodayDeaths;
      //assert
      expect(result, todayDeaths);
    },
  );
}
