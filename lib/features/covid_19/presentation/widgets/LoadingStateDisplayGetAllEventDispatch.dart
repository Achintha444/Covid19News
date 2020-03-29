import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/covid_bloc.dart';

class LoadingStateDisplayGetAllEventDispatch extends StatefulWidget {
  @override
  _LoadingStateDisplayGetAllEventDispatchState createState() =>
      _LoadingStateDisplayGetAllEventDispatchState();
}

class _LoadingStateDisplayGetAllEventDispatchState
    extends State<LoadingStateDisplayGetAllEventDispatch> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CovidBloc>(context).dispatch(GetAllCovidInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      height: (MediaQuery.of(context).size.height) / 4.5,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
