import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/covid_bloc.dart';

class WorldControl extends StatelessWidget {
  const WorldControl({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                style: TextStyle(letterSpacing: 1, color: Colors.white),
              ),
            ],
          ),
          onPressed: () {
            BlocProvider.of<CovidBloc>(context)
                .dispatch(GetAllCovidInfoEvent());
          },
        ),
      ],
    );
  }
}
