import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class SensorCard extends StatelessWidget {
  const SensorCard({
    super.key,
    required this.sensorName,
  });
  final String sensorName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 200,
          height: 325,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: GradientBoxBorder(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Colors.blue,
                  Colors.white,
                ])),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.white,
                ]),
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
                    Colors.blue,
                    Colors.white,
                  ]),
            ),
            child: Center(
                child: Text(
              sensorName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          // padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            width: 130,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.white,
                  ]),
            ),
            child: const Center(
                child: Text(
              'Mais detalhes',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
  }
}
