import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../domain/entities/empty_entity.dart';
import '../../domain/repos/splash_screen_repo.dart';

class SplashScreenRepoImpl implements SplashScreenRepo {
  NetworkInfo _networkInfo;

  SplashScreenRepoImpl({@required NetworkInfo networkInfo}) {
    this._networkInfo = networkInfo;
  }

  @override
  Future<Either<Faliure, EmptyEntity>> navigateToMainScreen() async {
    await Future.delayed(
      Duration(seconds: 4),
    );
    if (await this._networkInfo.isConnected) {
      return Right(EmptyEntity());
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
