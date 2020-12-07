import 'package:flutter/material.dart';
import 'package:systemvitals/piechart.dart';

class vitals extends StatelessWidget {
  double memory, cores, disk;
  vitals(this.memory, this.cores, this.disk);
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment
              .bottomCenter, // 10% of the width, so there are ten blinds.
          colors: [
            const Color(0xffFF8489),
            const Color(0xffD5ADC8)
          ], // red to yellow
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Total CPU Cores"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: w * 0.60,
                    height: h * 0.15 - 16,
                    child: Column(
                      children: [Text(this.cores.toString())],
                    ),
                  ),
                ),
              ),
              Text("Disk Usage"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: w * 0.60,
                    height: h * 0.5 - 16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Container(child: Pie(this.disk))],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text("Memory Usage"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      width: w * 0.2,
                      height: h * 0.65 + 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: h * 0.0058 * (this.memory),
                            color: Colors.blueAccent,
                          ),
                          Container(
                            height: h * 0.0058 * (100 - this.memory),
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ]),
        ],
      ),
    ));
  }
}
