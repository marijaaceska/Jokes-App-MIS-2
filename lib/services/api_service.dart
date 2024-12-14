import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/joke_model.dart';

class ApiService {
  static const String baseUrl = "https://official-joke-api.appspot.com";


  static Future<List<String>> getJokeTypes() async {
    final response = await http.get(Uri.parse("$baseUrl/types"));
    if (response.statusCode == 200) {
      List<String> types = List<String>.from(jsonDecode(response.body));
      return types;
    } else {
      throw Exception("Failed to load joke types");
    }
  }


  static Future<List<Joke>> getJokesByType(String type) async {
    final response = await http.get(Uri.parse("$baseUrl/jokes/$type/ten"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      return data.map((joke) => Joke.fromJson(joke)).toList();
    } else {
      throw Exception("Failed to load jokes!");
    }
  }

  static Future<Joke> getRandomJoke() async {
    final response = await http.get(Uri.parse("$baseUrl/random_joke"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Joke.fromJson(data);
    } else {
      throw Exception("Failed to load random joke!");
    }
  }
}