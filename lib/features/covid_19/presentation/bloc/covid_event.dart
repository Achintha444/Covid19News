part of 'covid_bloc.dart';

@immutable
abstract class CovidEvent {
}

class GetAllCovidInfoEvent extends CovidEvent{}

class GetCountrySpecificCovidInfoEvent extends CovidEvent{
  final String country;

  GetCountrySpecificCovidInfoEvent({@required this.country});
  
}

class GetLKSpecificCovidInfoEvent extends CovidEvent{}