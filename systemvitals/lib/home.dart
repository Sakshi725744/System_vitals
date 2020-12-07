import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:systemvitals/piechart.dart';
import 'package:systemvitals/vitals.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<double>> getNumber() async {
    var response = await http.get("URL");
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      double memory = jsonResponse['mem'];
      double disk= jsonResponse['disk_availability'];
      int cores = jsonResponse['total_cores'];
      double c =cores.toDouble();
      return [memory,c,disk];
    } else {
      return [0,0,0];
    }
  }

  Stream<List<double>> getNumbers(Duration refreshTime) async* {
    while (true) {
      await Future.delayed(refreshTime);
      yield await getNumber();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<double>>(
            stream: getNumbers(Duration(seconds: 1)),
            initialData: [0,0,0],
            builder: (context, stream) {
              if (stream.hasData) {
                return vitals(stream.data[0], stream.data[1], stream.data[2]);
              } else {
                return CircularProgressIndicator();
              }
            },
          );

  }
}
