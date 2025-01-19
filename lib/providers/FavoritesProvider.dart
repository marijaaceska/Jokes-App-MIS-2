import 'package:flutter/material.dart';
import '../models/joke_model.dart';

class FavoritesProvider with ChangeNotifier {
  List<Joke> _favoriteJokes = [];

  List<Joke> get favoriteJokes => _favoriteJokes;

  void addFavorite(Joke joke) {
    if(!_favoriteJokes.contains(joke)) {
      _favoriteJokes.add(joke);
      notifyListeners();
    }
  }

  void removeFavorite(Joke joke) {
    _favoriteJokes.remove(joke);
    notifyListeners();
  }

  bool isFavorite(Joke joke) {
    return _favoriteJokes.contains(joke);
  }

}