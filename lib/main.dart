import 'package:country/screens/country.dart';
import 'package:country/screens/countryMap.dart';
import 'package:flutter/material.dart';
import 'package:country/screens/allCountries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Country',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // appBarTheme: AppBarTheme(
        //   backgroundColor: Colors.white,
        // ),
      ),
      home: const AllCountries(),
      //Routing not used
      // routes: {
      //   Country.routeName: (context) => Country(),
      //   CountryMap.routeName: ((context) => CountryMap()),
      // },
    );
  }
}
