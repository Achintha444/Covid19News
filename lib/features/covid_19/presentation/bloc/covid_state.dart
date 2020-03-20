part of 'covid_bloc.dart';

@immutable
abstract class CovidState {}

class Empty extends CovidState {}

class Loading extends CovidState {}

class LoadedCovidAll extends CovidState {

  final CovidAll covidAll;

  LoadedCovidAll({@required this.covidAll});

}

class LoadedCovidCountry extends CovidState {

  final CovidCountry covidCountry;

  LoadedCovidCountry({@required this.covidCountry});

}

class Error extends CovidState {

  final String message;

  Error({@required this.message});

}
