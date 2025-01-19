import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/FavoritesProvider.dart';
import '../widgets/details/detail_data.dart';
import '../widgets/details/detail_title.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteJokes = Provider.of<FavoritesProvider>(context).favoriteJokes;

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Jokes"),
        backgroundColor: Colors.blue[200],
      ),
      body: ListView.builder(
        itemCount: favoriteJokes.length,
        itemBuilder: (context, index) {
          final joke = favoriteJokes[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailTitle(title: joke.setup),
                  DetailData(data: joke.punchline),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}