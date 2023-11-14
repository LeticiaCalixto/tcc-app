import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tcc_app/view/components/sensor_card.dart';

import '../../../models/sensor.dart';
import '../../../service/list_sensor.dart';
import '../modal/logout_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<SensorEntity>> futureSensors;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  late String emailResponsible = auth.currentUser!.email.toString();

  @override
  void initState() {
    super.initState();
    futureSensors = fetchSensors(emailResponsible: emailResponsible);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder<List<SensorEntity>>(
          future: fetchSensors(emailResponsible: emailResponsible),
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
                                      height: 200,
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
                                              Row(
                                                children: [
                                                  const SizedBox(width: 10),
                                                  Center(
                                                    child: Image.asset(
                                                      'assets/logo_tempmetter.png',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      dialogBuilder(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          const CircleBorder(),
                                                    ),
                                                    child: const Icon(
                                                      Icons.logout,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 28),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 60),
                                    SensorCardList(
                                      sensors: [
                                        for (var sensor
                                            in sensorsSnapshot.data!)
                                          SensorCard(
                                            sensor: sensor,
                                          )
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
              return Container(
                color: const Color(0xFF034AFF),
                child: const Center(
                  child: SpinKitFadingCircle(
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              );
            }
          }),
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