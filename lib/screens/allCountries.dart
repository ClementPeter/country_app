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
      print(response);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Countries"),
      ),
      body: Container(
          child: FutureBuilder(
        future: countries,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            return ListView.builder(
              // itemCount: countries.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(data![index]['name'].toString()),
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
