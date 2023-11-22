import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartComponent extends StatefulWidget {
  final bool showHorizontalLines;
  final bool showVerticalLines;

  const LineChartComponent({
    Key? key,
    this.showHorizontalLines = true,
    this.showVerticalLines = true,
  }) : super(key: key);

  @override
  State<LineChartComponent> createState() => _LineChartComponentState();
}

class _LineChartComponentState extends State<LineChartComponent> {
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LineChart(
          showAvg ? avgData() : mainData(),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: widget.showHorizontalLines,
        drawVerticalLine: widget.showVerticalLines,
        horizontalInterval: 0.2,
        verticalInterval: 0.2,
      ),
      titlesData: FlTitlesData(
        show: widget.showHorizontalLines || widget.showVerticalLines,
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              if (value >= 1 && value <= 10) {
                return Text(
                  '${value.toInt()}h',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                );
              } else {
                return const Text('');
              }
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              double roundedValue = (value * 10).round() / 10;
              if ((value - roundedValue).abs() < 0.1) {
                return Text(
                  '${roundedValue.toStringAsFixed(1)}°C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                );
              } else {
                return const Text('');
              }
            },
            reservedSize: 50,
          ),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, -1.3),
            FlSpot(1, -0.7),
            FlSpot(2, -0.6),
            FlSpot(3, -0.3),
            FlSpot(4, -0.9),
            FlSpot(5, -1),
            FlSpot(6, -1),
            FlSpot(7, -1.3),
            FlSpot(8, -1),
            FlSpot(9, -0.7),
            FlSpot(10, -1.3),
          ],
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      gridData: FlGridData(
        show: widget.showHorizontalLines,
        drawVerticalLine: widget.showVerticalLines,
        horizontalInterval: 1,
        verticalInterval: 1,
      ),
      titlesData: FlTitlesData(
        show: widget.showHorizontalLines || widget.showVerticalLines,
        topTitles: const AxisTitles(),
        rightTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              if (value >= 1 && value <= 10) {
                return Text(
                  '${value.toInt()}h',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                );
              } else {
                return const Text('');
              }
            },
          ),
        ),
        leftTitles: const AxisTitles(),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
          ),
        ),
      ],
    );
  }
}
