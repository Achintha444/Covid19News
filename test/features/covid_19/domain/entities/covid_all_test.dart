import 'package:covid_19_info/features/covid_19/domain/entities/covid_all.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final int cases = 1;
  final int deaths = 1;
  final int recovered = 1;

  final tCovidAll =
      CovidAll(cases: cases, deaths: deaths, recovered: recovered);

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
}
