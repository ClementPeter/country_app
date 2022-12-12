import 'package:country/screens/country.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({super.key});

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Countries"),
      ),
      body: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Country(),
              ),
            );
          },
          child: const Card(
              child: Text(
            "Germany",
          )),
        ),
      ),
    );
  }
}
