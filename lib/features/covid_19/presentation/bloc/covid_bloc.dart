import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_19_info/core/error/Faliure.dart';
import 'package:covid_19_info/core/Usecase/use_case.dart';
import 'package:covid_19_info/features/covid_19/domain/usecases/get_all_covid_info.dart';
import 'package:covid_19_info/features/covid_19/domain/usecases/get_country_specific_covid_info.dart';
import 'package:covid_19_info/features/covid_19/domain/usecases/get_lk_specific_covid_info.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/input_converter.dart';
import '../../domain/entities/covid_all.dart';
import '../../domain/entities/covid_country.dart';

part 'covid_event.dart';
part 'covid_state.dart';

const String SERVER_FALIURE_MESSAGE = 'Server Faliure';
const String CACHE_FALIURE_MESSAGE = 'Cache Faliure';
const String INVALID_INPUT_FALIURE_MESSAGE = 'Invalid Input Faliure';
const String COUNTRY_NOT_FOUND_FALIURE_MESSAGE = 'Country not Found';
const String UNEXPECTED_ERROR_MESSAGE = 'Unexpected Error';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  final GetAllCovidInfo getAllCovidInfo;
  final GetCountrySpecifiCovidInfo getCountrySpecifiCovidInfo;
  final GetLKSpecifiCovidInfo getLKSpecifiCovidInfo;
  final InputConverter inputConverter;

  CovidBloc({
    @required this.getAllCovidInfo,
    @required this.getCountrySpecifiCovidInfo,
    @required this.getLKSpecifiCovidInfo,
    @required this.inputConverter,
  });

  @override
  CovidState get initialState => Empty();

  @override
  Stream<CovidState> mapEventToState(
    CovidEvent event,
  ) async* {
    if (event is GetAllCovidInfoEvent) {
      yield Loading();
      final response = await getAllCovidInfo(
        NoParams(),
      );
      yield response.fold(
        (faliure) => Error(message: _mapFaliureToMessage(faliure)),
        (covidAll) => LoadedCovidAll(covidAll: covidAll),
      );
    } else if (event is GetCountrySpecificCovidInfoEvent) {
      final country = inputConverter.check(event.country);
      yield* country.fold(
        (faliure) async* {
          yield Error(message: INVALID_INPUT_FALIURE_MESSAGE);
        },
        (coun) async* {
          yield Loading();
          final response = await getCountrySpecifiCovidInfo(coun);
          yield response.fold(
            (faliure) => Error(message: _mapFaliureToMessage(faliure)),
            (covidCountry) => LoadedCovidCountry(covidCountry: covidCountry),
          );
        },
      );
    } else if (event is GetLKSpecificCovidInfoEvent) {
      yield Loading();
      final response = await getLKSpecifiCovidInfo(
        NoParams(),
      );
      yield response.fold(
        (faliure) => Error(message: _mapFaliureToMessage(faliure)),
        (covidCountry) => LoadedCovidCountry(covidCountry: covidCountry),
      );
    }
  }

  String _mapFaliureToMessage(Faliure faliure) {
    switch (faliure.runtimeType) {
      case ServerFaliure:
        return SERVER_FALIURE_MESSAGE;

      case CacheFaliure:
        return CACHE_FALIURE_MESSAGE;

      case CountryNotFoundFaliure:
        return COUNTRY_NOT_FOUND_FALIURE_MESSAGE;

      default:
        return UNEXPECTED_ERROR_MESSAGE;
    }
  }
}
