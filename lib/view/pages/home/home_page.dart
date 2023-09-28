import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        progress = 100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
            child: FAProgressBar(
              currentValue: progress.toInt(),
              displayText: '%',
              animatedDuration: const Duration(milliseconds: 500),
              direction: Axis.vertical,
              verticalDirection: VerticalDirection.up,
              progressColor: Colors.transparent,
              changeColorValue: 100,
              changeProgressColor: Colors.white,
              child: Image.asset('assets/logo_tempmetter.png'), // Substitua pelo caminho da sua imagem
            ),
          ),
          Center(
            child: FAProgressBar(
              currentValue: (100 - progress).toInt(),
              displayText: '%',
              animatedDuration: const Duration(milliseconds: 500),
              direction: Axis.vertical,
              verticalDirection: VerticalDirection.up,
              progressColor: Colors.transparent,
              changeColorValue: 0,
              changeProgressColor: Colors.white,
              child: Image.asset('assets/logo_inatel.png'), // Substitua pelo caminho da sua imagem
            ),
          ),
          if (progress == 100)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

// class SecondPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Center(
//             child: Image.asset('assets/logo_tempmetter.png'), // Substitua pelo caminho da sua imagem
//           ),
//           const Padding(
//             padding: EdgeInsets.only(bottom: 50.0),
//             child: CircularProgressIndicator(),
//           ),
//         ],
//       ),
//     );
//   }
// }
