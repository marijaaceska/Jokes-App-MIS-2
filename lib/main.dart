import 'package:flutter/material.dart';
import 'package:lab2/providers/FavoritesProvider.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'screens/random_joke.dart';


void main() {

  runApp(
    ChangeNotifierProvider(
        create: (context) => FavoritesProvider(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Joke App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/random': (context) => RandomJokeScreen(),
      },
    );
  }
}






