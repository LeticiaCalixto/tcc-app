import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tcc_app/view/pages/home/sensor_details.dart';

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
            border: const GradientBoxBorder(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color(0xFF034AFF),
                  Colors.white,
                ])),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF034AFF),
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
                    Color(0xFF034AFF),
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
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const SensorPage()));
          },
          child: Align(
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
                      Color(0xFF034AFF),
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
          ),
        )
      ],
    );
  }
}
