// ignore_for_file: unnecessary_new
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/controller/ProviderDemo.dart';
import 'home.dart';

class Second extends StatelessWidget {
  const Second({super.key});
  
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names
    return Consumer<provider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: (() {
                number = 0;
                questionindex = 0;
                qustnumber = 0;
                provider.barnumber();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => const Homepage())),
                );
              }),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Padding(
            padding: EdgeInsets.only(left: 90),
            child: Text(
              "Result",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            ),
          ),
        ),
        body: Stack(
          children: [
            Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_9xRnlw.json'),
            Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_obhph3sh.json'),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new CircularPercentIndicator(
                      progressColor: Colors.orange,
                      radius: 85.0,
                      lineWidth: 20.0,
                      animation: true,
                      percent: score / 12,
                      center: new Text(
                        "$score/12",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 250,
                      left: 150,
                    ),
                    child: SizedBox(
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  '   Ooops....!   ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            onPressed: () {
                              questionindex = 0;
                              qustnumber = 0;
                              score = 0;
                              provider.barnumber();
                              provider.markadding();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => (const Homepage()))),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 150),
                    child: SizedBox(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              questionindex = 0;
                              qustnumber = 0;
                              score = 0;
                              provider.barnumber();
                              provider.markadding();
                              questionindex = 0;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Homepage()),
                              );
                            },
                            child: const Padding(
                              padding:
                                  EdgeInsets.only(left: 10, bottom: 80),
                              child: Text(
                                'Try Again.',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
