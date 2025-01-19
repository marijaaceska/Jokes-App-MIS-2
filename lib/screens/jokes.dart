
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/joke_model.dart';
import '../providers/FavoritesProvider.dart';
import '../services/api_service.dart';
import '../widgets/details/detail_data.dart';
import '../widgets/details/detail_title.dart';
import 'favorite.dart';

class JokesScreen extends StatefulWidget {
  final String jokeType;

  JokesScreen({required this.jokeType});

  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  Future<void> fetchJokes() async {
    try {
      List<Joke> fetchedJokes = await ApiService.getJokesByType(widget.jokeType);
      setState(() {
        jokes = fetchedJokes;
      });
    } catch (e) {
      print("Error fetching jokes: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          "${widget.jokeType} Jokes",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.blue[700]),
        ),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];
          return Consumer<FavoritesProvider>(
            builder: (context, favoritesProvider, child) {
              final isFavorite = favoritesProvider.isFavorite(joke);
              return Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailTitle(title: joke.setup),
                      DetailData(data: joke.punchline),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          if (isFavorite) {
                            favoritesProvider.removeFavorite(joke);
                          } else {
                            favoritesProvider.addFavorite(joke);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
