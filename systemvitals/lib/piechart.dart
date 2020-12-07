import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Pie extends StatefulWidget {
  double m;
  Pie(this.m);
  @override
  _PieState createState() => _PieState();
}

class _PieState extends State<Pie> {
  int touchedIndex;
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
          pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
            setState(() {
              if (pieTouchResponse.touchInput is FlLongPressEnd ||
                  pieTouchResponse.touchInput is FlPanEnd) {
                touchedIndex = -1;
              } else {
                touchedIndex = pieTouchResponse.touchedSectionIndex;
              }
            });
          }),
          borderData: FlBorderData(
            show: false,
          ),
          sectionsSpace: 0,
          centerSpaceRadius: 40,
          sections: showingSections()),
    );

  }
  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.redAccent,
            value: widget.m,
            title: widget.m.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.blueAccent,
            value: 100-widget.m,
            title: (100-widget.m).toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );

        default:
          return null;
      }
    });
  }
}
