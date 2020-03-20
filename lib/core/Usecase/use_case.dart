import 'package:dartz/dartz.dart';
import '../error/Faliure.dart';

abstract class UseCase<Type,Params> {
  Future<Either<Faliure,Type>> call(Params params);
}

class NoParams {}