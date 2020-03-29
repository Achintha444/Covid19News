import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/covid_bloc.dart';
import '../widgets/CovidControl.dart';
import '../widgets/EmptyStateDisplay.dart';
import '../widgets/LoadedCovidAllStateDisplayNew.dart';
import '../widgets/LoadedCovidCountryDisplay.dart';
import '../widgets/LoadedCovidSLStateDisplayNew.dart';
import '../widgets/LoadingStateDisplay.dart';
import '../widgets/LoadingStateDisplayGetAllEventDispatch.dart';
import '../widgets/LoadingStateDisplayGetSLEventDispatch.dart';
import '../widgets/SLControl.dart';
import '../widgets/WorldControl.dart';
import '../widgets/app_bar_design.dart';

class CovidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarDesign(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                //* World Part
                _buildWorld(context),

                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                ),

                //* SL Part
                _buildSL(context),

                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                ),

                //* Country Part
                _buildCountry(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocProvider<CovidBloc> _buildWorld(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<CovidBloc>(),
      child: Column(
        children: <Widget>[
          WorldControl(),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
          ),
          BlocBuilder<CovidBloc, CovidState>(builder: (context, state) {
            if (state is Empty) {
              return new LoadingStateDisplayGetAllEventDispatch();
            } else if (state is LoadedCovidAll) {
              return LoadedCovidAllStateDisplayNew(
                covidAll: state.covidAll,
              );
            } else if (state is ErrorAll) {
              return EmptyStateDisplay(
                message: state.message,
              );
            } else {
              return Text(state.toString());
            }
          }),
        ],
      ),
    );
  }

  BlocProvider<CovidBloc> _buildSL(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<CovidBloc>(),
      child: Column(
        children: <Widget>[
          SLControl(),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
          ),
          BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is Empty) {
                return new LoadingStateDisplayGetSLEventDispatch();
              } else if (state is LoadedCovidSL) {
                return LoadedCovidSLStateDisplayNew(
                  covidSL: state.covidSL,
                );
              } else if (state is ErrorSL) {
                return EmptyStateDisplay(
                  message: state.message,
                );
              } else {
                return Text(state.toString());
              }
            },
          ),
        ],
      ),
    );
  }

  BlocProvider<CovidBloc> _buildCountry(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<CovidBloc>(),
      child: Column(
        children: <Widget>[
          Text(
            'Update of a Country'.toUpperCase(),
            style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 2.5,
              bottom: 2.5,
            ),
          ),
          BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is Empty) {
                return EmptyStateDisplay(
                    message: 'Input a Country to get Updates');
              } else if (state is Loading) {
                return LoadingStateDisplay();
              } else if (state is Error) {
                return EmptyStateDisplay(message: state.message);
              } else if (state is LoadedCovidCountry) {
                return LoadedCovidCountryDisplay(
                    covidCountry: state.covidCountry);
              }
            },
          ),
          CovidControl(),
        ],
      ),
    );
  }
}
