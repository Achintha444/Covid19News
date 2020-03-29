import '../widgets/WorldControl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/covid_bloc.dart';
import '../widgets/CovidControl.dart';
import '../widgets/EmptyStateDisplay.dart';
import '../widgets/LoadedCovidAllStateDisaplay.dart';
import '../widgets/LoadedCovidAllStateDisplayNew.dart';
import '../widgets/LoadedCovidCountryDisplay.dart';
import '../widgets/LoadedCovidSLStateDisplayNew.dart';
import '../widgets/LoadingStateDisplay.dart';
import '../widgets/LoadingStateDisplayGetAllEventDispatch.dart';
import '../widgets/LoadingStateDisplayGetSLEventDispatch.dart';
import '../widgets/SLControl.dart';
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
                _buildWorld(context),

                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                ),

                _buildSL(context),
                //* Top Half
                _buildCountry(context),
                //* Bottom Half
                new CovidControl(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocProvider<CovidBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<CovidBloc>(),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'World'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                  ),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 2,
                            right: 2,
                          ),
                        ),
                        Text(
                          'Refresh'.toUpperCase(),
                          style:
                              TextStyle(letterSpacing: 1, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
              ),

              BlocBuilder<CovidBloc, CovidState>(builder: (context, state) {
                if (state is Loading) {
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

              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sri Lanka'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                  ),
                  RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 2,
                            right: 2,
                          ),
                        ),
                        Text(
                          'Refresh'.toUpperCase(),
                          style:
                              TextStyle(letterSpacing: 1, color: Colors.white),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
              ),

              BlocBuilder<CovidBloc, CovidState>(builder: (context, state) {
                if (state is Loading) {
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
              }),

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
                    return LoadedCovidCountryDisplay(
                        covidCountry: state.covidCountry);
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
            if (state is Loading) {
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
              if (state is Loading) {
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
      child: BlocBuilder<CovidBloc, CovidState>(
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
            return LoadedCovidCountryDisplay(covidCountry: state.covidCountry);
          }
        },
      ),
    );
  }
}
