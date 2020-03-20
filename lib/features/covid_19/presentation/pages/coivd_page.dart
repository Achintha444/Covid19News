import '../../../../injection_container.dart';
import '../bloc/covid_bloc.dart';
import '../widgets/app_bar_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ),
    );
  }
}