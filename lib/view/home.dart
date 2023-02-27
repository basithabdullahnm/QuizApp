import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/controller/Api.dart';
import 'package:quizapp/model/model.dart';
import 'package:quizapp/view/Splashscreen.dart';
import 'package:quizapp/view/resultpage.dart';
import 'package:quizapp/view/second.dart';
import '../controller/ProviderDemo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}
List<Zepto> zepto = [];
int questionindex = 0;
int number = 1;
int buttonindex = 0;
int score = 0;
int selctedopttion = 0;
int qustnumber = 1;
class HomepageState extends State<Homepage> {
  bool firstButton = false;
  bool hasBeenPressed2 = false;
  bool hasBeenPressed3 = false;
  bool hasBeenPressed4 = false;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    // ignore: avoid_types_as_parameter_names
    return Consumer<provider>(builder: (context, provider, child) {
      firstButton = provider.firstButton;
      hasBeenPressed2 = provider.secondButton;
      hasBeenPressed3 = provider.thirdButton;
      hasBeenPressed4 = provider.forthButton;
      questionindex = provider.questionindex;
      buttonindex = provider.buttonindex;
      score = provider.score;
      selctedopttion = provider.selctedopttion;
      return FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                      onPressed: (() {
                        Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => (const Splash()))),
                              );
                      }),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  title: const Padding(
                    padding: EdgeInsets.only(left: 100),
                    child: Text(
                      "Quiz",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                  ),
                ),
                body: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 260, top: 10),
                        child: Container(
                          height: 30,
                          width: 65,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 190, 193, 190),
                                  offset: Offset(
                                    2.0,
                                    2.0,
                                  ),
                                  blurRadius: 2.0,
                                  spreadRadius: 1.0,
                                ),
                              ]),
                          child: Center(
                            child: Text(
                              "$number/12",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, right: 90,left: 60),
                        child: Text(
                         
                            '${zepto[0].questions[provider.questionindex].question}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Divider(
                          thickness: 3,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 39,
                          width: 39,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 190, 193, 190),
                                  offset: Offset(
                                    2.0,
                                    2.0,
                                  ),
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                ),
                              ]),
                          child: const Center(
                              child: Text(
                            "?",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      const Text(
                        "Choose an answer",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: h * 0.05,
                            width: w * 0.9,
                            child: ElevatedButton(
                              onPressed: () {
                                provider.colorChangeofFirstButton();
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: MaterialStateColor.resolveWith(
                                      (states) => firstButton
                                          ? Colors.black
                                          : Colors.blue),
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              child: Row(
                                children: [
                                  const Text("A"),
                                  const SizedBox(
                                    width: 90,
                                  ),
                                  Text(zepto[0].questions[provider.questionindex].answers[0],)  
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: h * 0.05,
                          width: w * 0.9,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.colorChangeofSecondButton();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: MaterialStateColor.resolveWith(
                                    (states) => hasBeenPressed2
                                        ? Colors.black
                                        : Colors.blue),
                                textStyle: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            child: Row(
                              children: [
                                const Text("B"),
                                const SizedBox(
                                  width: 80,
                                ),
                                  Text(zepto[0].questions[provider.questionindex].answers[1],)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: h * 0.05,
                          width: w * 0.9,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.colorChangeofthirdButton();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => hasBeenPressed3
                                        ? Colors.black
                                        : Colors.blue),
                                textStyle: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            child: Row(
                              children: [
                                const Text("C"),
                                const SizedBox(
                                  width: 90,
                                ),
                              Text(zepto[0].questions[provider.questionindex].answers[2],)    
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: h * 0.05,
                          width: w * 0.9,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.colorChangeofforthButton();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: MaterialStateColor.resolveWith(
                                    (states) => hasBeenPressed4
                                        ? Colors.black
                                        : Colors.blue),
                                textStyle: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            child: Row(
                              children: [
                                const Text("D"),
                                const SizedBox(
                                  width: 50,
                                ),      
                                Text(zepto[0].questions[provider.questionindex].answers[3],)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 290),
                        child: SizedBox(
                          child: Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 10),
                                child: Row(
                                  children: const [
                                    Text(
                                      'Next',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    Icon(
                                      Icons.arrow_right_alt_outlined,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
                                onPressed: () {
                                  provider.markadding();
                                  provider.questions();
                                  provider.Button_clearing();
                                  provider.resat();
                                  // print(score);
                                  check();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    });
   }
  void check() {
    if (questionindex == 11  ) {
      if (score >= 6) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => Firstpage())),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => const Second())),
        );
      }
    }
  }
}
