import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';

import '../entities/empty_entity.dart';
import '../repos/splash_screen_repo.dart';

class NavigateToMainScreen implements UseCase<EmptyEntity,NoParams>{
  SplashScreenRepo _splashScreenRepo;

  NavigateToMainScreen({@required SplashScreenRepo splashScreenRepo}) {
    this._splashScreenRepo = splashScreenRepo;
  }

  @override
  Future<Either<Faliure, EmptyEntity>> call(NoParams params) async {
    return await this._splashScreenRepo.navigateToMainScreen();
  }


}
