part of 'covid_bloc.dart';

@immutable
abstract class CovidState {}

class Empty extends CovidState {}

class Loading extends CovidState {}

class LoadingAll extends CovidState {}

class LoadingSL extends CovidState {}

class LoadedCovidAll extends CovidState {

  final CovidAll covidAll;

  LoadedCovidAll({@required this.covidAll});

}

class LoadedCovidSL extends CovidState {

  final CovidCountry covidSL;

  LoadedCovidSL({@required this.covidSL});

}

class LoadedCovidCountry extends CovidState {

  final CovidCountry covidCountry;

  LoadedCovidCountry({@required this.covidCountry});

}

class Error extends CovidState {

  final String message;

  Error({@required this.message});

}

class ErrorAll extends CovidState {

  final String message;

  ErrorAll({@required this.message});

}

class ErrorSL extends CovidState {

  final String message;

  ErrorSL({@required this.message});

}
