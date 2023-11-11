import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tcc_app/service/auth_service.dart';
import 'package:tcc_app/view/pages/home/home_page.dart';
import 'package:tcc_app/view/pages/home/register_page.dart';

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
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF034AFF),
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
                    const Gap(40),
                    SizedBox(
                      width: 228,
                      child: Image.asset('assets/logo_tempmetter.png'),
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
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: TextButton(
                    //     onPressed: () {},
                    //     style: Theme.of(context).textButtonTheme.style,
                    //     child: Text(
                    //       'Esqueceu a senha?',
                    //       style:
                    //           Theme.of(context).textTheme.bodySmall?.copyWith(
                    //                 color: Colors.grey[400],
                    //                 fontWeight: FontWeight.bold,
                    //               ),
                    //     ),
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        verifyPasswordAndEmail(
                          context,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        authService(
                          email: _emailController.text,
                          password: _passwordController.text,
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          onUserNotFound: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Usuário não encontrado.'),
                              ),
                            );
                          },
                          onWrongPassword: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Senha incorreta.'),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Login',
                      ),
                    ),
                    const Gap(20),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        'Criar conta',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
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

void verifyPasswordAndEmail(
  BuildContext context, {
  required String email,
  required String password,
}) {
  if (email.isEmpty || password.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Preencha todos os campos.'),
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
