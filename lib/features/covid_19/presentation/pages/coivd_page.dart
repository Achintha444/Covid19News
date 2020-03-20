import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/covid_bloc.dart';
import '../widgets/CovidControl.dart';
import '../widgets/EmptyStateDisplay.dart';
import '../widgets/LoadedCovidAllStateDisaplay.dart';
import '../widgets/LoadingStateDisplay.dart';
import '../widgets/app_bar_design.dart';

class CovidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarDesign(),
      body: SingleChildScrollView(
        child: _buildBody(context),
      ),
    );
  }

  BlocProvider<CovidBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<CovidBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              //* Top Half
              BlocBuilder<CovidBloc, CovidState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return EmptyStateDisplay(message: 'Start Searching');
                  } else if (state is Loading) {
                    return LoadingStateDisplay();
                  } else if (state is Error) {
                    return EmptyStateDisplay(message: state.message);
                  } else if (state is LoadedCovidAll) {
                    return LoadedCovidAllStateDisplay(covidAll: state.covidAll);
                  } else if (state is LoadedCovidCountry) {
                    re
                  }
                },
              ),

              //* Bottom Half
              new CovidControl(),
            ],
          ),
        ),
      ),
    );
  }
}
