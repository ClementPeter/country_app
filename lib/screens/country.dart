import 'package:country/screens/countryMap.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Country extends StatelessWidget {
  //routing
  static const routeName = "/country";
  const Country({super.key, this.country});

  final Map? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country!["name"]!),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
            // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            // maxCrossAxisExtent: 100,
            // childAspectRatio: 3 / 2,
            // ),
            //Aloes the grid view to resize its cross axis count based on the window
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200),
            children: [
              FlipCard(
                front: const CountryCard(
                  title: "Capital",
                ),
                back: CountryDetails(
                  title: country!["capital"] ?? "No Capital",
                ),
              ),
              FlipCard(
                front: const CountryCard(
                  title: "Flag",
                ),
                back: Card(
                  child: Center(
                    child: SvgPicture.network(
                      country!["flags"]["svg"] ??
                          country!["flag"] ??
                          Text("Not found"),
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
              ),
              FlipCard(
                front: const CountryCard(
                  title: "Population",
                ),
                back: CountryDetails(
                  title: addCommas(country!["population"])
                      .toString(), //Add comma in between the numbers
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
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return CountryMap();
                      }),
                    ),
                  );
                },
                child: const Card(
                  child: Center(
                    child: Text("Show on Map"),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

//Snippet of CHATGPPT answer
String addCommas(num number) {
  final parts = number.toString().split('.');
  final intPart = parts[0];
  final decPart = parts.length > 1 ? parts[1] : null;
  return intPart.replaceAllMapped(
          RegExp(r'(\d{3})(?=\d)'), (match) => '${match[0]},') +
      (decPart != null ? '.$decPart' : '');
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
