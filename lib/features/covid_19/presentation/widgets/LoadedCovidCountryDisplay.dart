import 'package:flutter/material.dart';

import '../../domain/entities/covid_country.dart';

class LoadedCovidCountryDisplay extends StatelessWidget {
  final CovidCountry covidCountry;

  const LoadedCovidCountryDisplay({Key key, @required this.covidCountry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(this.covidCountry.getImageUrl);
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      height: (MediaQuery.of(context).size.height) / 1.4,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                covidCountry.getCountry.toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 2.5,
                bottom: 2.5,
              ),
            ),
            Center(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                    width: 1,
                  ),
                ),
                child: Image(
                  image: NetworkImage(
                    this.covidCountry.getImageUrl,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            Center(
              child: Text(
                'Cases : ' + covidCountry.getCases.toString(),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
            ),
            Center(
              child: Text(
                'Today Cases : ' + covidCountry.getTodayCases.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
            ),
            Center(
              child: Text(
                'Deaths : ' + covidCountry.getDeaths.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
            ),
            Center(
              child: Text(
                'Today Deaths : ' + covidCountry.getTodayDeaths.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
            ),
            Center(
              child: Text(
                'Recovered : ' + covidCountry.getRecovered.toString(),
                style: TextStyle(
                  fontSize: 20,
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
                'Active Cases : ' + covidCountry.getActive.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
            ),
            Center(
              child: Text(
                'Critical : ' + covidCountry.getCritical.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
            ),
            Center(
              child: Text(
                'Cases Per Million : ' +
                    covidCountry.getCasesPerOneMillion.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
