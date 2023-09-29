import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showTopImage = true;
  bool showBottomImage = true;
  double progress = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showTopImage = false;
        showBottomImage = false;
        progress = 100;
      });
    });
    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          if (showTopImage)
            Padding(
              padding: EdgeInsets.only(top: 250, left: 35),
              child: Image.asset('assets/logo_inatel.png'),
            ),
          Spacer(),
          if (showBottomImage)
            Padding(
              padding: EdgeInsets.only(bottom: 250, left: 60),
              child: Image.asset('assets/logo_tempmetter.png'),
            ),
          if (progress == 100)
            Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Positioned(
                    top: 300,
                    left: 60,
                    child: Image.asset('assets/logo_tempmetter.png'),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 180,
                    child: const CircularProgressIndicator(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Image.asset('assets/logo_tempmetter.png'), // Substitua pelo caminho da sua imagem
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 100, // Ajuste para o tamanho desejado
                      height: 100, // Ajuste para o tamanho desejado
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue, // Cor da borda
                          width: 2, // Espessura da borda
                        ),
                        borderRadius:
                            BorderRadius.circular(10), // Bordas levemente arredondadas
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.blue, Colors.white],
                          stops: [0.5, 0.5], // Isso cria uma borda de gradiente
                        ),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white), // Substitua pelo ícone desejado
                        onPressed: () {
                          // Adicione a ação do botão aqui
                        },
                      ),
                    ),
                    Text('Adicionar Sensor'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          colors: [Color(0xFF195AFF), Color(0xFF195AFF)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: IconButton(
                        icon:
                            Icon(Icons.delete, color:
                                Colors.white), // Substitua pelo ícone desejado
                        onPressed: () {
                          // Adicione a ação do botão aqui
                        },
                      ),
                    ),
                    Text('Remover Sensor'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(50),
                        gradient:
                            LinearGradient(colors:
                                [Color(0xFF195AFF), Color(0xFF195AFF)],
                                begin:
                                    Alignment.topCenter,
                                end:
                                    Alignment.bottomCenter),
                      ),
                      child:
                          IconButton(icon:
                              Icon(Icons.edit, color:
                                  Colors.white), // Substitua pelo ícone desejado
                              onPressed:
                                  () {
                            // Adicione a ação do botão aqui
                          }),
                    ),
                    Text('Editar Sensor'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
