import 'package:country/screens/country.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AllCountries extends StatefulWidget {
  const AllCountries({super.key});

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  //
  late Future<List?> countries;

  //
  Future<List?> getCountries() async {
    try {
      var response = await Dio().get('https://restcountries.com/v2/all');
      // print(response);
      return response.data;
    } catch (e) {
      print(":::::::::::::$e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    countries = getCountries();
    super.initState();
  }

  //Toggles the TextField
  bool isShowSearch = false;

  @override
  Widget build(BuildContext context) {
    // print(countries["name"])
    // print(countries["latlng"]) //List
    //     print(countries["flags"]) //MAP
    //        print(countries["languages"][0]) //List
    return Scaffold(
      appBar: AppBar(
          title: isShowSearch
              ? TextField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                  ),
                )
              : const Text("All Countries"),
          actions: [
            //search button
            IconButton(
              onPressed: () {
                setState(() {
                  isShowSearch = !isShowSearch;
                });
              },
              icon: const Icon(Icons.search),
            ),
          ]),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: countries,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView.builder(
                // itemCount: countries.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Country(
                              country: data[index],
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          data![index]['name'].toString(),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )),
    );
  }
}


// ListView(
//             children: const [
//               Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Card(
//                     child: Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Text(
//                       "Germany",
//                     ),
//                   ),
//                 )),
//               ),
//             ],
//           ),
