import 'package:flutter/material.dart';
import 'package:quizapp/view/Splashscreen.dart';
import 'package:provider/provider.dart';
import 'controller/ProviderDemo.dart';

void main() {
  runApp(ChangeNotifierProvider<provider>(
    create: (context) => provider(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash (),
    ),
  ));
}
