import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/movie.dart';
import 'package:movie_listing_app/services/movie_data.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class MovieProvider extends ChangeNotifier {
  final LocalMovieRepository _repository = LocalMovieRepository();
  List<Movie> _movies = [];
  List<Movie> _filteredMovies = [];
  String _searchQuery = "";

  List<Movie> get movies => _filteredMovies;
  String get searchQuery => _searchQuery;

  Future<void> loadMovies(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    _movies = _repository.getMovies();
    _filteredMovies = _movies;

    for (var movie in _movies) {
      if (movie.posterUrl.isNotEmpty) {
        final image = Image.network(movie.posterUrl).image;
        if (context.mounted) {
          await precacheImage(image, context);
        }
      }
    }

    notifyListeners();
  }

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
