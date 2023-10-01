import 'package:flutter/material.dart';
import 'package:tcc_app/view/components/outline_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Image.asset('assets/logo_inatel.png'),
                  ),
                  Center(
                    child: Image.asset(
                      'assets/logo_tempmetter.png',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // const CircularProgressIndicator(),
                ],
              );
            } else {
              return FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 3)),
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
                      return Padding(
                        padding: const EdgeInsets.only(top: 200),
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
                                    child: Image.asset('assets/trash_icon.png'),
                                  ),
                                  const SizedBox(width: 25),
                                  CustomOutlinedButton(
                                    label: const Text(
                                      'Editar\nSensor',
                                      textAlign: TextAlign.center,
                                    ),
                                    child: Image.asset('assets/edit_icon.png'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      );
                    }
                  });
            }
          }),
    );
  }
}
