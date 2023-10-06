import 'package:flutter/material.dart';
import 'package:tcc_app/models/sensor.dart';

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
                  Image.asset(
                    'assets/logo_tempmetter.png',
                    height: 70,
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
                        widget.sensor.sensorName,
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
            Text("fgdsg")
          ],
        ),
      ),
    );
  }
}
