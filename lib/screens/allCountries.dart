import 'package:country/screens/country.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

//Home page class - For searching based Apps we tend to use List to decode/brkdwn our jsonData to the entire App
class AllCountries extends StatefulWidget {
  const AllCountries({super.key});

  @override
  State<AllCountries> createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  //
  List countries = [];

  //
  List filteredCountries = [];

  //
  getCountries() async {
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
    getCountries().then((data) {
      setState(() {
        countries = filteredCountries = data;
      });
    });
    super.initState();
  }

  //Toggles the TextField
  bool isShowSearch = false;

  //Search functionality using .where query
  void _filteredCountries(String value) {
    print(value);
    setState(() {
      filteredCountries = countries
          .where((country) =>
              country["name"].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(countries["name"])
    // print(countries["latlng"]) //List
    //     print(countries["flags"]) //MAP
    //        print(countries["languages"][0]) //List
    return Scaffold(
      appBar: AppBar(
          title: isShowSearch
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 40,
                    // width: SizeConfig.screenWidth * 0.6,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _filteredCountries(value);
                        });
                      },
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search Product",
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        // contentPadding: EdgeInsets.symmetric(
                        //   horizontal: 5,
                        //   vertical: -20,
                        // ),
                      ),
                    ),
                  ),
     
                )
              : const Text("All Countries"),
          centerTitle: true,
          actions: [
            //search button
            IconButton(
              icon: !isShowSearch
                  ? const Icon(Icons.search)
                  : const Icon(Icons.cancel),
              onPressed: () {
                setState(() {
                  isShowSearch = !isShowSearch;
                  filteredCountries = countries;
                });
              },
            ),
          ]),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            // filteredCountries.isNotEmpty - works too
            child: filteredCountries.length > 0
                ? ListView.builder(
                    itemCount: filteredCountries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Country(
                                  country: filteredCountries[index],
                                );
                              },
                            ),
                          );
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              filteredCountries[index]['name'].toString(),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  )),
      ),
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
