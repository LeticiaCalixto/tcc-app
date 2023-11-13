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
        horizontalInterval: 1,
        verticalInterval: 1,
        // Restante do código...
      ),
      titlesData: FlTitlesData(
        show: widget.showHorizontalLines || widget.showVerticalLines,
        // Restante do código...
      ),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
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
        // Restante do código...
      ),
      titlesData: FlTitlesData(
        show: widget.showHorizontalLines || widget.showVerticalLines,
        // Restante do código...
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
