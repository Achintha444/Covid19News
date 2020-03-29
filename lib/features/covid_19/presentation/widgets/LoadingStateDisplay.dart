import 'package:flutter/material.dart';

class LoadingStateDisplay extends StatelessWidget {
  const LoadingStateDisplay({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      height: (MediaQuery.of(context).size.height) / 3,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

