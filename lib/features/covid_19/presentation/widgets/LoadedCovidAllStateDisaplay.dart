import 'package:flutter/material.dart';

import '../../domain/entities/covid_all.dart';

class LoadedCovidAllStateDisplay extends StatelessWidget {
  final CovidAll covidAll;

  const LoadedCovidAllStateDisplay({Key key, @required this.covidAll})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      height: (MediaQuery.of(context).size.height) / 2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'All Cases : ' + covidAll.getCases.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
            ),
            Center(
              child: Text(
                'All Deaths : ' + covidAll.getDeaths.toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
            ),
            Center(
              child: Text(
                'All Recovered : ' + covidAll.getRecovered.toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
              ),
            ),
            Center(
              child: Text(
                'All Active Cases : ' +
                    (covidAll.getCases -
                            covidAll.getDeaths -
                            covidAll.getRecovered)
                        .toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    
    );
  }
}
