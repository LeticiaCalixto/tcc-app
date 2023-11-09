import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tcc_app/view/components/outline_button.dart';
import 'package:tcc_app/view/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 500,
                width: size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset('assets/logo.png'),
                    ),
                    const Gap(40),
                    TempmetterTextField(
                      label: 'Email',
                      controller: _emailController,
                    ),
                    const Gap(30),
                    TempmetterTextField(
                      label: 'Senha',
                      controller: _passwordController,
                    ),
                    const Gap(30),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        child: const Text(
                          'Login',
                        )),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class TempmetterTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TempmetterTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 15),
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
