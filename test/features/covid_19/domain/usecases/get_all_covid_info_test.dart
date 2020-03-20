import 'package:covid_19_info/core/Usecase/use_case.dart';
import 'package:covid_19_info/features/covid_19/domain/entities/covid_all.dart';
import 'package:covid_19_info/features/covid_19/domain/repos/covid_repo.dart';
import 'package:covid_19_info/features/covid_19/domain/usecases/get_all_covid_info.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCovidRepo extends Mock implements CovidRepo {}

void main() {
  GetAllCovidInfo getAllCovidInfo;
  MockCovidRepo mockCovidRepo;

  setUp(() {
    mockCovidRepo = new MockCovidRepo();
    getAllCovidInfo = new GetAllCovidInfo(repo: mockCovidRepo);
  });

  final int cases = 1;
  final int deaths = 1;
  final int recovered = 1;

  final tCovidAll =
      CovidAll(cases: cases, deaths: deaths, recovered: recovered);

  //* call()
  test(
    'should return the CovidAll object when called the call() ',
    () async {
      //arrange
      when(mockCovidRepo.getAllCovidInfo()).thenAnswer(
        (_) async => Right(tCovidAll),
      );
      //act
      final result = await getAllCovidInfo(NoParams());
      //assert
      expect(result, Right(tCovidAll));
      verify(mockCovidRepo.getAllCovidInfo());
      verifyNoMoreInteractions(mockCovidRepo);
    },
  );
}
