import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_19_info/core/Usecase/use_case.dart';
import 'package:covid_19_info/features/splash_screen/domain/usecases/navigate_to_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  NavigateToMainScreen _navigateToMainScreen;

  SplashScreenBloc({@required NavigateToMainScreen navigateToMainScreen}) {
    this._navigateToMainScreen = navigateToMainScreen;
  }

  @override
  SplashScreenState get initialState => Initial();


  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    if (event is NavigateToMainScreenEvent) {
      yield Loading();
      final response = await this._navigateToMainScreen.call(
            NoParams(),
          );
      yield response.fold(
        (faliure) => InternetError(),
        (_) => Loaded(),
      );
    }
  }
}
