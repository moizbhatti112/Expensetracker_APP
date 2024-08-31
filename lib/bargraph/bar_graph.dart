import 'package:expense/bargraph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final double maxY;
  final double sunamount;
  final double monamount;
  final double tueamount;
  final double wedamount;
  final double thuramount;
  final double friamount;
  final double satamount;

  const MyBarGraph(
      {super.key,
      required this.maxY,
      required this.sunamount,
      required this.monamount,
      required this.tueamount,
      required this.wedamount,
      required this.thuramount,
      required this.friamount,
      required this.satamount});

  @override
  Widget build(BuildContext context) {
    BarData mybardata = BarData(
        sunamount: sunamount,
        monamount: monamount,
        tueamount: tueamount,
        wedamount: wedamount,
        thuramount: thuramount,
        friamount: friamount,
        satamount: satamount);
    mybardata.intializeBarData();
    return BarChart(BarChartData(
        maxY: maxY,
        minY: 0,
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          // leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBotttomTitles
                  )
                  ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: mybardata.barData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.grey[800],
                      width: 25,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true, toY: maxY, color: Colors.grey[200]))
                ]))
            .toList()));
  }
}

Widget getBotttomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w800);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        'S',
        style: style,
      );
      break;
    case 1:
      text = const Text(
        'M',
        style: style,
      );
      break;
    case 2:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 3:
      text = const Text(
        'W',
        style: style,
      );
      break;
    case 4:
      text = const Text(
        'T',
        style: style,
      );
      break;
    case 5:
      text = const Text(
        'F',
        style: style,
      );
      break;
    case 6:
      text = const Text(
        'S',
        style: style,
      );
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide,child: text, );
}
