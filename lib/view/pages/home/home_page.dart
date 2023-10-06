import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tcc_app/view/components/outline_button.dart';
import 'package:tcc_app/view/components/sensor_card.dart';

import '../../../models/sensor.dart';
import '../../../service/list_sensor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<SensorEntity>> futureSensors;

  @override
  void initState() {
    super.initState();
    futureSensors = fetchSensors();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Colors.white, Color(0xFF0047FF)],
          ),
        ),
        child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 0)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Image.asset('assets/logo_inatel.png'),
                    ),
                    Expanded(
                      child:
                          Container(), // Espaço vazio para ocupar o espaço disponível
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 180, left: 30),
                      child: Center(
                        child: Image.asset(
                          'assets/logo_tempmetter.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                );
              } else {
                return FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 0)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/logo_tempmetter.png',
                              ),
                            ),
                            const SpinKitWanderingCubes(
                              size: 40,
                              color: Colors.white,
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Container(
                              width: size.width,
                              height: 350,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40),
                                ),
                                border: GradientBoxBorder(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white,
                                      Color(0xFF034AFF),
                                    ],
                                  ),
                                  width: 2,
                                ),
                              ),
                              child: DecoratedBox(
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(38),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 60),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/logo_tempmetter.png',
                                        ),
                                      ),
                                      const SizedBox(height: 28),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 22),
                                        child: Row(
                                          children: [
                                            CustomOutlinedButton(
                                              label: const Text(
                                                'Adicionar\nSensor',
                                                textAlign: TextAlign.center,
                                              ),
                                              child: Image.asset(
                                                  'assets/sensor_icon.png'),
                                            ),
                                            const SizedBox(width: 25),
                                            CustomOutlinedButton(
                                              label: const Text(
                                                'Remover\nSensor',
                                                textAlign: TextAlign.center,
                                              ),
                                              child: Image.asset(
                                                  'assets/trash_icon.png'),
                                            ),
                                            const SizedBox(width: 25),
                                            CustomOutlinedButton(
                                              label: const Text(
                                                'Editar\nSensor',
                                                textAlign: TextAlign.center,
                                              ),
                                              child: Image.asset(
                                                  'assets/edit_icon.png'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const SensorCardList(
                              sensors: [
                                SensorCard(
                                  sensor: SensorEntity(
                                    sensorId: 1,
                                    sensorName: "Caixa 3",
                                    temperature: 3,
                                  ),
                                ),
                                SensorCard(
                                  sensor: SensorEntity(
                                    sensorId: 2,
                                    sensorName: "Geladeira",
                                    temperature: 1,
                                  ),
                                ),
                                SensorCard(
                                  sensor: SensorEntity(
                                    sensorId: 3,
                                    sensorName: "Caixa 12",
                                    temperature: -3,
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      }
                    });
              }
            }),
      ),
    );
  }
}

class SensorCardList extends StatelessWidget {
  const SensorCardList({
    super.key,
    required this.sensors,
  });

  final List<SensorCard> sensors;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 320,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: sensors.length,
        padding: const EdgeInsets.only(left: 20, right: 20),
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (_, index) {
          return sensors[index];
        },
      ),
    );
  }
}
