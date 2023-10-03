import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tcc_app/view/components/outline_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2)),
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
                  future: Future.delayed(const Duration(seconds: 4)),
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
                          const CircularProgressIndicator(),
                        ],
                      );
                    } else {
                      return Container(
                        width: size.width,
                        height: 390,
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
                                Colors.blue,
                              ],
                            ),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 22),
                                child: Row(
                                  children: [
                                    CustomOutlinedButton(
                                      label: const Text(
                                        'Adicionar\nSensor',
                                        textAlign: TextAlign.center,
                                      ),
                                      child:
                                          Image.asset('assets/sensor_icon.png'),
                                    ),
                                    const SizedBox(width: 25),
                                    CustomOutlinedButton(
                                      label: const Text(
                                        'Remover\nSensor',
                                        textAlign: TextAlign.center,
                                      ),
                                      child:
                                          Image.asset('assets/trash_icon.png'),
                                    ),
                                    const SizedBox(width: 25),
                                    CustomOutlinedButton(
                                      label: const Text(
                                        'Editar\nSensor',
                                        textAlign: TextAlign.center,
                                      ),
                                      child:
                                          Image.asset('assets/edit_icon.png'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      );
                    }
                  });
            }
          }),
    );
  }
}
