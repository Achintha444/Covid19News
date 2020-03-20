import 'package:covid_19_info/core/Error/Faliure.dart';
import 'package:dartz/dartz.dart';
import '../Error/Faliure.dart';

class InputConverter {
  Either<Faliure, String> check(String str) {
    try {
      final alphanumeric = RegExp('[a-zA-Z ^ [0-9] ^!@#%^&*()_+{}|""<>,./?');
      final response = alphanumeric.hasMatch(str);
      if (!response) throw FormatException();
      return Right(str);
    } on FormatException {
      return Left(InvalidInputFaliure());
    }
  }
}
