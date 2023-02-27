import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/view/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [
              Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_z35UZP.json'),
          ),        
        ],
      ),
            Center(                   
                child: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 111, 122),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          ' START ....QUIZ ',
                          style: TextStyle(
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: ((context) => (const Homepage()))),
                      );
                    },
          ),
                  ),
                ),
              ), 
        ]
      )  
    );
  }
}
  