import 'package:flutter/material.dart';

import 'features/covid_19/presentation/constants/theme_data.dart';
import 'features/covid_19/presentation/pages/coivd_page.dart';
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
      home: CovidPage(),
    );
  }
}