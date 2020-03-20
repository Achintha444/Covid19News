import 'dart:convert';

import 'package:covid_19_info/features/covid_19/data/models/covid_all_model.dart';
import 'package:covid_19_info/features/covid_19/domain/entities/covid_all.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final int cases = 250618;
  final int deaths = 10254;
  final int recovered = 89044;

  final tCovidAll =
      CovidAllModel(cases: cases, deaths: deaths, recovered: recovered);

  test(
    'should be a subclass of CovidAll',
    () async {
      //assert
      expect(tCovidAll, isA<CovidAll>());
    },
  );

  //* fromJson()
  test(
    'should return CovidAllModel when fromJson() called',
    () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(
        fixtureReader('coivd_all.json'),
      );
      //act
      final result = CovidAllModel.fromJson(jsonMap);
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
        "cases": 250618,
        "deaths": 10254,
        "recovered": 89044,
      };
      expect(result, expectedMap);
    },
  );
}
