import 'package:covid_19_info/core/Error/Faliure.dart';
import 'package:covid_19_info/core/Error/exceptions.dart';
import 'package:covid_19_info/core/Platform/network_info.dart';
import 'package:covid_19_info/features/covid_19/data/datasources/covid_local_data_source.dart';
import 'package:covid_19_info/features/covid_19/data/datasources/covid_remote_data_source.dart';
import 'package:covid_19_info/features/covid_19/data/models/covid_all_model.dart';
import 'package:covid_19_info/features/covid_19/data/models/covid_country_model.dart';
import 'package:covid_19_info/features/covid_19/data/repos/covid_repo_impl.dart';
import 'package:covid_19_info/features/covid_19/domain/entities/covid_all.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements CovidRemoteDataSource {}

class MockLocalDataSource extends Mock implements CovidLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;
  CovidRepoImpl covidRepoImpl;

  setUp(() {
    mockRemoteDataSource = new MockRemoteDataSource();
    mockLocalDataSource = new MockLocalDataSource();
    mockNetworkInfo = new MockNetworkInfo();
    covidRepoImpl = new CovidRepoImpl(
      covidRemoteDataSource: mockRemoteDataSource,
      covidLocalDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group(
    'getAllCovidInfo()',
    () {
      final int cases = 250618;
      final int deaths = 10254;
      final int recovered = 89044;

      final tCovidAllModel =
          CovidAllModel(cases: cases, deaths: deaths, recovered: recovered);
      final CovidAll tCovidAll = tCovidAllModel;

      test(
        'should check if the device is online',
        () async {
          //arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          //act
          covidRepoImpl.getAllCovidInfo();
          //assert
          verify(mockNetworkInfo.isConnected);
        },
      );

      group(
        'when the device is online',
        () {
          setUp(
            () {
              when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
            },
          );
          test(
            'should return remote data and cache data',
            () async {
              //arrange
              when(mockRemoteDataSource.getAllCovidInfo())
                  .thenAnswer((_) async => tCovidAllModel);
              //act
              final result = await covidRepoImpl.getAllCovidInfo();
              //assert
              verify(mockRemoteDataSource.getAllCovidInfo());
              verify(mockLocalDataSource.cacheAllCovidInfo(tCovidAllModel));
              expect(result, Right(tCovidAllModel));
            },
          );
        },
      );

      group(
        'when the device is offline',
        () {
          setUp(
            () {
              when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
            },
          );

          test(
            'should return local all data',
            () async {
              //arrange
              when(mockLocalDataSource.getLastAllCovidInfo())
                  .thenAnswer((_) async => tCovidAllModel);
              //act
              final result = await covidRepoImpl.getAllCovidInfo();
              //assert
              verify(mockLocalDataSource.getLastAllCovidInfo());
              verifyZeroInteractions(mockRemoteDataSource);
              expect(result, Right(tCovidAllModel));
            },
          );
        },
      );
    },
  );

  group(
    'getCountrySpecifiCovidInfo()',
    () {
      final String imageUrl = 'https://restcountries.eu/data/usa.svg';
      final String country = 'test';
      final int cases = 1;
      final int deaths = 1;
      final int recovered = 1;
      final int todayDeaths = 1;
      final int active = 1;
      final int critical = 1;
      final int casesPerOneMillion = 1;

      final tCovidCountryModel = CovidCountryModel(
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
        'should check if the device is online',
        () async {
          //arrange
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
          //act
          covidRepoImpl.getAllCovidInfo();
          //assert
          verify(mockNetworkInfo.isConnected);
        },
      );

      group(
        'when the device is online',
        () {
          setUp(
            () {
              when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
            },
          );
          test(
            'should return remote data and cache data',
            () async {
              //arrange
              when(mockRemoteDataSource.getCountrySpecifiCovidInfo(any))
                  .thenAnswer((_) async => tCovidCountryModel);
              //act
              final result = await covidRepoImpl.getCountrySpecifiCovidInfo('USA');
              //assert
              verify(mockRemoteDataSource.getCountrySpecifiCovidInfo(any));
              verify(mockLocalDataSource.cacheCountrySpecifiCovidInfo(tCovidCountryModel));
              expect(result, Right(tCovidCountryModel));
            },
          );
        },
      );

      group(
        'when the device is offline',
        () {
          setUp(
            () {
              when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
            },
          );

          test(
            'should return local all data',
            () async {
              //arrange
              when(mockLocalDataSource.getLastCountrySpecifiCovidInfo())
                  .thenAnswer((_) async => tCovidCountryModel);
              //act
              final result = await covidRepoImpl.getCountrySpecifiCovidInfo('USA');
              //assert
              verify(mockLocalDataSource.getLastCountrySpecifiCovidInfo());
              verifyZeroInteractions(mockRemoteDataSource);
              expect(result, Right(tCovidCountryModel));
            },
          );
        },
      );
    
    },
  );
}
