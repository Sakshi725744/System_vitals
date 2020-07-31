import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_thermometer/thermometer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_gauge/flutter_gauge.dart';

class Vitals extends StatefulWidget {
  @override
  _VitalsState createState() => _VitalsState();
}

class _VitalsState extends State<Vitals> {
  @override
  Widget build(BuildContext context) {

    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      backgroundColor: Colors.black,

      body: SlidingUpPanel(

        panel: Center(
          child: Text("This is the sliding Widget"),
        ),

        collapsed:Scaffold(
          backgroundColor: Colors.black,
          body: CustomPaint(
            child: Container(

              height: 200.0,
            ),

            painter: CurvePainter(),
          ),
        ),




        body:Column(
            children:[  Padding(
                padding: EdgeInsets.all(15),
                  child:Card(
                  elevation: 8,
                  shadowColor: Colors.white,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Column(children: [
                    FlutterGauge(index: 25.0,counterStyle : TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.bold),secondsMarker: SecondsMarker.minutes,number: Number.all,numberInAndOut: NumberInAndOut.inside,activeColor: const Color(0xffFF1476), width:MediaQuery.of(context).size.width-50,handColor: Colors.white,inactiveColor: const Color(0xff00ffff), backgroundColor: Colors.white,textStyle: TextStyle(color: Colors.white),isCircle: false,counterAlign: CounterAlign.center,hand: Hand.short,
                    ),
                   /* Align(
                      alignment: Alignment.topCenter,
                      child: Text("CPU USAGE",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 30),),
                    )*/
                  ]
                  ))

              ),
              Thermometer(
                backgroundColor: Colors.black,
                barWidth: 20,
                outlineColor: Colors.white,
                mercuryColor: Colors.red,


                              )

            ]
        ),
        


        borderRadius: radius,
      ),
    );
  }
}
class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();


    path.lineTo(0, size.height *0.75);
    path.quadraticBezierTo(size.width* 0.10, size.height*0.70,   size.width*0.17, size.height*0.90);
    path.quadraticBezierTo(size.width*0.20, size.height, size.width*0.25, size.height*0.90);
    path.quadraticBezierTo(size.width*0.40, size.height*0.40, size.width*0.50, size.height*0.70);
    path.quadraticBezierTo(size.width*0.60, size.height*0.85, size.width*0.65, size.height*0.65);
    path.quadraticBezierTo(size.width*0.70, 0, size.width, size.height);
    path.lineTo(size.width, size.height );
    path.lineTo(0, size.height );
   // path.lineTo(size.width, size.height );
    path.close();

    paint.color = Colors.red;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height*0.50);
    path.quadraticBezierTo(size.width*0.10, size.height*0.80, size.width*0.15, size.height*0.60);
    path.quadraticBezierTo(size.width*0.20, size.height*0.45, size.width*0.27, size.height*0.60);
    path.quadraticBezierTo(size.width*0.45, size.height, size.width*0.50, size.height*0.80);
    path.quadraticBezierTo(size.width*0.55, size.height*0.45, size.width*0.75, size.height*0.75);
    path.quadraticBezierTo(size.width*0.85, size.height*0.93, size.width, size.height*0.60);
    path.lineTo(size.width, size.height );
    path.lineTo(0, size.height );

    path.close();

    paint.color = Colors.red[100];
    canvas.drawPath(path, paint);

    path =Path();
    path.lineTo(0, size.height*0.75);
    path.quadraticBezierTo(size.width*0.10, size.height*0.55, size.width*0.22, size.height*0.70);
    path.quadraticBezierTo(size.width*0.30, size.height*0.90, size.width*0.40, size.height*0.75);
    path.quadraticBezierTo(size.width*0.52, size.height*0.50, size.width*0.65, size.height*0.70);
    path.quadraticBezierTo(size.width*0.75, size.height*0.85, size.width, size.height*0.60);
    path.lineTo(size.width, size.height );
    path.lineTo(0, size.height );
    path.close();

    paint.color = Colors.red[200];
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}
