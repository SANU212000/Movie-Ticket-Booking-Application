import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/movie.dart';
import 'package:movie_listing_app/services/movie_data.dart';

class MovieProvider extends ChangeNotifier {
  final LocalMovieRepository _repository = LocalMovieRepository();
  List<Movie> _movies = [];
  List<Movie> _filteredMovies = [];
  String _searchQuery = "";

  MovieProvider() {
    _movies = _repository.getMovies();
    _filteredMovies = _movies;
  }

  List<Movie> get movies => _filteredMovies;
  String get searchQuery => _searchQuery;

  void updateSearchQuery(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _filteredMovies = _movies;
    } else {
      _filteredMovies =
          _movies
              .where(
                (movie) =>
                    movie.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }

  Map<String, List<Movie>> get moviesByGenre {
    Map<String, List<Movie>> genreMap = {};
    for (var movie in _filteredMovies) {
      for (var genre in movie.genres) {
        if (!genreMap.containsKey(genre)) {
          genreMap[genre] = [];
        }
        genreMap[genre]!.add(movie);
      }
    }
    return genreMap;
  }
}
