import 'package:covid_19_info/core/Usecase/use_case.dart';
import 'package:covid_19_info/features/covid_19/domain/entities/covid_country.dart';
import 'package:covid_19_info/features/covid_19/domain/repos/covid_repo.dart';
import 'package:covid_19_info/features/covid_19/domain/usecases/get_lk_specific_covid_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCovidRepo extends Mock implements CovidRepo {}

void main() {
  GetLKSpecifiCovidInfo getLKSpecifiCovidInfo;
  MockCovidRepo mockCovidRepo;

  setUp(
    () {
      mockCovidRepo = new MockCovidRepo();
      getLKSpecifiCovidInfo =
          new GetLKSpecifiCovidInfo(repo: mockCovidRepo);
    },
  );

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

  //* call()
  test(
    'should return the CovidCountry() object when called',
    () async {
      //arrange
      when(mockCovidRepo.getLKSpecifiCovidInfo()).thenAnswer(
        (_) async => Right(tCovidAll),
      );
      //act
      final result = await getLKSpecifiCovidInfo(NoParams());
      //assert
      expect(result, Right(tCovidAll));
      verify(mockCovidRepo.getLKSpecifiCovidInfo());
      verifyNoMoreInteractions(mockCovidRepo);
    },
  );
}
