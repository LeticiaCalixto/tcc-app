import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tcc_app/models/sensor.dart';

import '../../components/line_chart.dart';

class SensorDetailsPage extends StatefulWidget {
  const SensorDetailsPage({
    super.key,
    required this.sensor,
  });

  final SensorEntity sensor;

  @override
  State<SensorDetailsPage> createState() => _SensorDetailsPageState();
}

class _SensorDetailsPageState extends State<SensorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Colors.white, Color(0xFF0047FF)],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 215,
              padding: const EdgeInsets.only(top: 70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(10),
                        ),
                        child: const Row(
                          children: [
                            Gap(20),
                            Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xFF0047FF),
                            ),
                            Gap(30),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/logo_tempmetter.png',
                        height: 70,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 280,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [
                          Color(0xFFFFF9F2),
                          Color(0xFF2C68FF),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.sensor.name ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 385,
              child: Padding(
                padding: EdgeInsets.only(top: 70),
                child: LineChartComponent(),
              ),
            ),
            const Gap(30),
            const Text(
              'Temperatura atual:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Text(
                '${widget.sensor.temperature.toString()}°C',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Gap(30),
            const Text(
              'Faixa de temperatura aceitavel:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Center(
              child: Text(
                '${widget.sensor.tempMin != null ? widget.sensor.tempMin.toString() + '°C' : '!'}'
                '   à   '
                '${widget.sensor.tempMax != null ? widget.sensor.tempMax.toString() + '°C' : '!'}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
