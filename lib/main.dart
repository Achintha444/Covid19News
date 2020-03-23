import 'package:covid_19_info/features/covid_19/presentation/pages/coivd_page.dart';
import 'package:covid_19_info/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

import 'features/covid_19/presentation/constants/theme_data.dart';
import 'injection_container.dart';

Future<void> main() async {
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid 19 News',
      theme: themeData,
      routes: <String,WidgetBuilder>{
        '/splash': (BuildContext context) => SplashScreen(),
        '/covidPage': (BuildContext context) => CovidPage(),
      },
      home: SplashScreen(),
    );
  }
}