import 'package:flutter/material.dart';

class InternetErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'NO INTERNET'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  letterSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 3,
                bottom: 3,
              ),
            ),
            Center(
              child: Text(
                'connection'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  letterSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),
            Center(
              child: Text(
                'Connect to internet and try again'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
