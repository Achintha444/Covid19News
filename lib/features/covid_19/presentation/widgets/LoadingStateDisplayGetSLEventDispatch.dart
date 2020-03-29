import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/covid_bloc.dart';

class LoadingStateDisplayGetSLEventDispatch extends StatefulWidget {
  @override
  _LoadingStateDisplayGetSLEventDispatchState createState() =>
      _LoadingStateDisplayGetSLEventDispatchState();
}

class _LoadingStateDisplayGetSLEventDispatchState
    extends State<LoadingStateDisplayGetSLEventDispatch> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CovidBloc>(context).dispatch(GetLKSpecificCovidInfoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      height: (MediaQuery.of(context).size.height) / 4,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
