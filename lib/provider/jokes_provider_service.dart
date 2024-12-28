import 'dart:convert';

import 'package:dad_jokes_app/model/jokes_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JokesProviderService extends ChangeNotifier {
  JokeModel? _jokes;
  JokeModel? get joke => _jokes;
  Future<void> getData() async {
    var url = "https://api.chucknorris.io/jokes/random";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _jokes = JokeModel.fromJson(data);
        notifyListeners();
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
