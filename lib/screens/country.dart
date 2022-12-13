import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Country extends StatelessWidget {
  const Country({super.key, this.country});

  final Map? country;

  @override
  Widget build(BuildContext context) {
    print(country!["flag"]);
    return Scaffold(
        appBar: AppBar(
          title: Text(country!["name"]!),
        ),
        body: GridView(
          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 100,
          //   childAspectRatio: 3 / 2,
          //   crossAxisSpacing: 20,
          //   mainAxisSpacing: 20,
          // ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),

          children: [
            FlipCard(
              front: const CountryCard(
                title: "Capital",
              ),
              back: CountryDetails(
                title: country!["capital"],
              ),
            ),
            FlipCard(
              front: const CountryCard(
                title: "Flag",
              ),
              back: Card(
                child: Center(
                  child: SvgPicture.network(
                    country!["flag"] ?? country!["flag"]["svg"],
                    //country!["flag"]["svg"] ?? country!["flag"],
                    width: 150,
                  ),
                ),
              ),
            ),
            FlipCard(
              front: const CountryCard(
                title: "Population",
              ),
              back: CountryDetails(
                title: country!["population"].toString(),
              ),
            ),
            FlipCard(
              front: const CountryCard(
                title: "Currency",
              ),
              back: CountryDetails(
                title: country!["currencies"][0]["name"],
              ),
            ),
            const CountryCard(
              title: "Show on Map",
            ),
          ],
        ));
  }
}

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(child: Text(title!)),
    );
  }
}

class CountryDetails extends StatelessWidget {
  const CountryDetails({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(child: Text(title!)),
    );
  }
}
