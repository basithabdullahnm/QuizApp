

import 'package:quizapp/model/model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizapp/view/home.dart';


  Future<List<Zepto>> getData() async {
    // ignore: non_constant_identifier_names
    final Response = await http
        .get(Uri.parse('https://637dbfffcfdbfd9a639bba1e.mockapi.io/sample'));
    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        zepto.add(Zepto.fromJson(index));
      }
    }
    return zepto;
  }
