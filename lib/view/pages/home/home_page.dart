import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tcc_app/view/components/drop_down_menu_button.dart';
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

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    futureSensors = fetchSensors();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder<List<SensorEntity>>(
          future: fetchSensors(),
          builder: (context, sensorsSnapshot) {
            if (sensorsSnapshot.hasData) {
              return DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [
                      Colors.white,
                      Color(0xFF0047FF),
                    ],
                  ),
                ),
                child: FutureBuilder(
                    future: Future.delayed(const Duration(seconds: 1)),
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
                              child: Container(),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 180, left: 30),
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
                            future: Future.delayed(const Duration(seconds: 2)),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'assets/logo_tempmetter.png',
                                      ),
                                    ),
                                    const SpinKitFadingCircle(
                                      size: 60,
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
                                            borderRadius:
                                                BorderRadius.circular(38),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 60),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Image.asset(
                                                  'assets/logo_tempmetter.png',
                                                ),
                                              ),
                                              const SizedBox(height: 28),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 22),
                                                child: Row(
                                                  children: [
                                                    CustomOutlinedButton(
                                                      label: const Text(
                                                        'Adicionar\nSensor',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      onPressed: () {
                                                        showAddModal(
                                                          context,
                                                          sensors:
                                                              sensorsSnapshot
                                                                  .data,
                                                        );
                                                      },
                                                      child: Image.asset(
                                                          'assets/sensor_icon.png'),
                                                    ),
                                                    const SizedBox(width: 25),
                                                    CustomOutlinedButton(
                                                      label: const Text(
                                                        'Remover\nSensor',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      onPressed: () {
                                                        showRemoveModal(
                                                            context);
                                                      },
                                                      child: Image.asset(
                                                          'assets/trash_icon.png'),
                                                    ),
                                                    const SizedBox(width: 25),
                                                    CustomOutlinedButton(
                                                      label: const Text(
                                                        'Editar\nSensor',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      onPressed: () {
                                                        showAddModal(context,
                                                            sensors:
                                                                sensorsSnapshot
                                                                    .data);
                                                      },
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
                                            sensorName: 'Caixa 3',
                                            temperature: 3,
                                            tempMax: 5,
                                            tempMin: 0,
                                            description: "Vacina 1",
                                          ),
                                        ),
                                        SensorCard(
                                          sensor: SensorEntity(
                                            sensorName: 'Geladeira',
                                            temperature: 1,
                                            tempMax: 4,
                                            tempMin: -2,
                                            description: "Vacina 2",
                                          ),
                                        ),
                                        SensorCard(
                                          sensor: SensorEntity(
                                            sensorName: 'Caixa 12',
                                            temperature: -3,
                                            tempMax: -7,
                                            tempMin: -2,
                                            description: "Vacina 3",
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
              );
            } else {
              return const Center(
                child: SpinKitFadingCircle(
                  size: 60,
                  color: Colors.white,
                ),
              );
            }
          }),
    );
  }

  showAddModal(
    BuildContext context, {
    required List<SensorEntity>? sensors,
  }) {
    String title = 'Adicionar Sensor';
    String confirmationButton = 'Salvar';
    String skipButton = 'Cancelar';

    TextEditingController descriptionController = TextEditingController();
    TextEditingController tempMinController = TextEditingController();
    TextEditingController tempMaxController = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: [
              Text(title, style: Theme.of(context).textTheme.headline5),
              const SizedBox(
                height: 16,
              ),
              DropDownMenuButton(items: [
                sensors,
              ]),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(label: Text('Descrição')),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    child: TextFormField(
                      controller: tempMinController,
                      decoration: const InputDecoration(
                          label: Text('Temperatura Minima')),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 140,
                    child: TextFormField(
                      controller: tempMaxController,
                      decoration: const InputDecoration(
                          label: Text('Temperatura Máxima')),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(skipButton),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //TODO: Implementar adição
                      },
                      child: Text(confirmationButton)),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  showRemoveModal(BuildContext context) {
    String title = 'Adicionar Sensor';
    String confirmationButton = 'Apagar';
    String skipButton = 'Cancelar';

    TextEditingController nameController = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: [
              Text(title, style: Theme.of(context).textTheme.headline5),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(label: Text('Nome do Sensor')),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(skipButton),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // SensorEntity sensorsEntity = SensorEntity(
                        //     sensorName: nameController.text, temperature: 0);
                      },
                      child: Text(confirmationButton)),
                ],
              )
            ],
          ),
        );
      },
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
