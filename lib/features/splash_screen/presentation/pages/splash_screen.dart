import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../covid_19/presentation/pages/coivd_page.dart';
import '../bloc/splash_screen_bloc.dart';
import '../widgets/internet_error_widget.dart';
import '../widgets/splash_screen_widget.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<SplashScreenBloc>(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            condition: (prev, cur) {
              if ((prev == Loading()) && (cur == Loaded())) {
                return false;
              }
              return true;
            },
            builder: (context, state) {
              if ((state is Initial) || (state is Loading)) {
                return SplashScreenWidget();
              } else if (state is Loaded) {
                return CovidPage();
              } else if (state is InternetError) {
                return InternetErrorWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
