import 'package:flutter/material.dart';
import '../../screens/jokes.dart';


class JokeCard extends StatelessWidget {
  final String jokeType;

  const JokeCard({super.key, required this.jokeType});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          jokeType,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.blue[500],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JokesScreen(jokeType: jokeType),
            ),
          );
        },
      ),
    );
  }
}
