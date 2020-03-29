import 'package:covid_19_info/features/covid_19/presentation/bloc/covid_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingStateDisplayEventDispatch extends StatefulWidget {
  final CovidEvent event;

  LoadingStateDisplayEventDispatch({@required this.event});

  @override
  _LoadingStateDisplayEventDispatchState createState() =>
      _LoadingStateDisplayEventDispatchState();
}

class _LoadingStateDisplayEventDispatchState
    extends State<LoadingStateDisplayEventDispatch> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CovidBloc>(context).dispatch(widget.event);
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
