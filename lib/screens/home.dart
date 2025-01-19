import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/cards/card_data.dart';
import 'favorite.dart';
import 'random_joke.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    fetchJokeTypes();
  }

  Future<void> fetchJokeTypes() async {
    try {
      List<String> types = await ApiService.getJokeTypes();
      setState(() {
        jokeTypes = types;
      });
    } catch (e) {
      print("Error fetching joke types: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text
          (
            "Types of Jokes",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.blue[700]),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb, color: Colors.blue),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RandomJokeScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: jokeTypes.length,
        itemBuilder: (context, index) {
          return JokeCard(jokeType: jokeTypes[index]);
        },
      ),
    );
  }
}
