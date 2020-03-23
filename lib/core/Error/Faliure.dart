import 'package:equatable/equatable.dart';

abstract class Faliure extends Equatable {
  Faliure([List props = const <dynamic>[]]) : super(props);
}

//General Faliures

class ServerFaliure extends Faliure {}

class CacheFaliure extends Faliure {}

class CountryNotFoundFaliure extends Faliure{}

class InvalidInputFaliure extends Faliure{}

class InternetConnectionFaliure extends Faliure{}
