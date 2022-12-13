import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  const Country({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        child: const Card(
            child: Text(
          "Germany",
        )),
      ),
    );
  }
}
