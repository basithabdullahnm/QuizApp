
import 'package:flutter/material.dart';
import 'package:quizapp/view/home.dart';


// ignore: camel_case_types
class provider extends ChangeNotifier {
  bool firstButton = false;
  bool secondButton = false;
  bool thirdButton = false;
  bool forthButton = false;

  int questionindex = 0;
  int buttonindex = 0;
  int score = 0;
  int selctedopttion = 0;
  

  void questions() {
    if (questionindex != 11) {
      questionindex++;
    }
    notifyListeners();
  }

  void colorChangeofFirstButton() {
    firstButton = true;
    secondButton = false;
    thirdButton = false;
    forthButton = false;
    buttonindex = 0;
    selctedopttion = 0;
    notifyListeners();
  }

  void colorChangeofSecondButton() {
    firstButton = false;
    secondButton = true;
    thirdButton = false;
    forthButton = false;
    buttonindex = 1;
    selctedopttion = 1;
    notifyListeners();
  }

  void colorChangeofthirdButton() {
    firstButton = false;
    secondButton = false;
    thirdButton = true;
    forthButton = false;
    buttonindex = 2;
    selctedopttion = 2;
    notifyListeners();
  }

  void colorChangeofforthButton() {
    firstButton = false;
    secondButton = false;
    thirdButton = false;
    forthButton = true;
    buttonindex = 3;
    selctedopttion = 3;
    notifyListeners();
  }

  void barnumber() {
    number = 1;
    questionindex = 0;
    score = 0;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void Button_clearing() {
    firstButton = false;
    secondButton = false;
    thirdButton = false;
    forthButton = false;
    notifyListeners();
  }

  void resat() {
    number++;
    notifyListeners();
  }

  void markadding() {
    if (questionindex == 0) {
      if (forthButton) {
        score++;
      }
    }
    if (questionindex == 1) {
      if (secondButton) {
        score++;
      }
    }
    if (questionindex == 2) {
      if (forthButton) {
        score++;
      }
    }
    if (questionindex == 3) {
      if (thirdButton) {
        score++;
      }
    }
    if (questionindex == 0) {
      if (thirdButton) {
        score++;
      }
    }
    if (questionindex == 1) {
      if (thirdButton) {
        score++;
      }
    }
    if (questionindex == 2) {
      if (firstButton) {
        score++;
      }
    }
    if (questionindex == 3) {
      if (thirdButton) {
        score++;
      }
    }
    if (questionindex == 0) {
      if (thirdButton) {
        score++;
      }
    }
    if (questionindex == 1) {
      if (forthButton) {
        score++;
      }
    }
    if (questionindex == 2) {
      if (forthButton) {
        score++;
      }
    }
    if (questionindex == 3) {
      if (secondButton) {
        score++;
      }
    }
    notifyListeners();
  }
}
