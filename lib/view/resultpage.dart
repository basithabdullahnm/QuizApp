// ignore_for_file: unnecessary_new
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/view/home.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:lottie/lottie.dart';
import '../controller/ProviderDemo.dart';
// ignore: must_be_immutable 
class Firstpage extends StatelessWidget {
  Firstpage({super.key});
  int score = 0;
  @override
  Widget build(BuildContext context) {
    score = context.read<provider>().score;
    // ignore: avoid_types_as_parameter_names
    return Consumer<provider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: (() {
                questionindex = 0;
                qustnumber = 0;
                provider.barnumber();
                Navigator.pushReplacement(
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
                'https://assets5.lottiefiles.com/packages/lf20_obhph3sh.json'),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new CircularPercentIndicator(
                      progressColor: Colors.green,
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
                    padding: const EdgeInsets.only(top: 200, left: 150),
                    child: SizedBox(
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: Row(
                              children: const [
                                Text(
                                  'Awesome!',
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
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Congratulations",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "You passed the exame",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
