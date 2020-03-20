import '../bloc/covid_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidControl extends StatelessWidget {
  const CovidControl({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(onPressed: () {
      BlocProvider.of<CovidBloc>(context).dispatch(
        GetAllCovidInfoEvent(),
      );
    });
  }
}