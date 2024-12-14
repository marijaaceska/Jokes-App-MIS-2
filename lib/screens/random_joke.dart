import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/details/detail_title.dart';
import '../widgets/details/detail_data.dart';

class RandomJokeScreen extends StatefulWidget {
  @override
  _RandomJokeScreenState createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  String setup = '';
  String punchline = '';

  @override
  void initState() {
    super.initState();
    fetchRandomJoke();
  }

  Future<void> fetchRandomJoke() async {
    try {
      final joke = await ApiService.getRandomJoke();
      setState(() {
        setup = joke.setup;
        punchline = joke.punchline;
      });
    } catch (e) {
      print("Error fetching joke: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Random Joke of Day",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.blue[700])),
          backgroundColor: Colors.blue[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailTitle(title: setup),
            DetailData(data: punchline),
          ],
        ),
      ),
    );
  }
}
