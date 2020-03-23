import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../entities/empty_entity.dart';

abstract class SplashScreenRepo {
  Future<Either<Faliure,EmptyEntity>> navigateToMainScreen();
}