import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tcc_app/view/pages/home/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: size.width,
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                const Gap(50),
                const Text(
                  'Cadastro de usuário',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              TempmetterTextField(
                label: 'Name',
                controller: _nameController,
              ),
              const Gap(20),
              TempmetterTextField(
                label: 'Email',
                controller: _emailController,
              ),
              const Gap(20),
              TempmetterTextField(
                label: 'Senha',
                controller: _passwordController,
              ),
              const Gap(20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  'Cadastrar',
                ),
              ),
            ]),
          )
        ],
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
        color: const Color.fromARGB(255, 236, 235, 238),
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
