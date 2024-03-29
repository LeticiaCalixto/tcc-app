import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tcc_app/models/sensor.dart';
import 'package:tcc_app/view/pages/home/sensor_details_page.dart';

import 'line_chart.dart';

class SensorCard extends StatelessWidget {
  const SensorCard({
    Key? key,
    required this.sensor,
  }) : super(key: key);

  final SensorEntity sensor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 200,
          height: 425,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: const GradientBoxBorder(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF034AFF),
                  Colors.white,
                ],
              ),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF034AFF),
                Colors.white,
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 180,
          child: Padding(
            padding: EdgeInsets.only(top: 70),
            child: LineChartComponent(
              showHorizontalLines: false,
              showVerticalLines: false,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Center(
            child: Text(
              '${sensor.temperature.toString()}°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            width: 130,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF034AFF),
                  Colors.white,
                ],
              ),
            ),
            child: Center(
              child: Text(
                sensor.name ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 105),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SensorDetailsPage(
                    sensor: sensor,
                  ),
                ),
              );
            },
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 146, 171, 235),
                      Color.fromARGB(255, 9, 29, 207),
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Mais detalhes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
