import 'package:flutter/material.dart';

import '../../domain/entities/covid_all.dart';

class LoadedCovidAllStateDisplayNew extends StatelessWidget {
  final CovidAll covidAll;

  LoadedCovidAllStateDisplayNew({@required this.covidAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.7,
                width: MediaQuery.of(context).size.height / 3.7,
                child: Card(
                  color: Colors.blueGrey,
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Total'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Cases'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 5,
                          ),
                        ),
                        Text(
                          this.covidAll.getCases.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.7,
                width: MediaQuery.of(context).size.height / 3.7,
                child: Card(
                  color: Colors.red,
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Total'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Deaths'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 5,
                          ),
                        ),
                        Text(
                          this.covidAll.getDeaths.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.7,
                width: MediaQuery.of(context).size.height / 3.7,
                child: Card(
                  color: Colors.green,
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Total'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Recovered'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 5,
                          ),
                        ),
                        Text(
                          this.covidAll.getRecovered.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.7,
                width: MediaQuery.of(context).size.height / 3.7,
                child: Card(
                  color: Colors.orange,
                  margin: EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Active'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Cases'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 5,
                          ),
                        ),
                        Text(
                          (this.covidAll.getCases -
                                  this.covidAll.getDeaths -
                                  this.covidAll.getRecovered)
                              .toString(),
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
