import 'package:flutter/material.dart';
import 'package:movie_listing_app/utils/carousel%20_card.dart';
import 'package:movie_listing_app/utils/movie_genre.dart';
import 'package:movie_listing_app/utils/squre_box.dart';
import 'package:provider/provider.dart';
import 'package:movie_listing_app/provider/movie_provider.dart';
import 'package:movie_listing_app/screens/movie_details_screen.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    bool isSearching = _searchController.text.isNotEmpty;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.amber.shade600, Colors.black, Colors.black],
              ),
            ),
          ),
          Positioned.fill(
            child: Center(child: SquareWithConnectedBoxes(size: 1000)),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    decoration: InputDecoration(
                      hintText: "Search movies...",
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      fillColor: Colors.grey[900],
                    ),
                    style: TextStyle(color: Colors.white),
                    onChanged: (query) {
                      movieProvider.updateSearchQuery(query);
                    },
                  ),
                ),

                if (isSearching)
                  /// 📜 Search Results List
                  Expanded(
                    child: ListView.builder(
                      itemCount: movieProvider.movies.length,
                      itemBuilder: (context, index) {
                        final movie = movieProvider.movies[index];
                        return ListTile(
                          leading: Image.network(
                            movie.posterUrl,
                            width: 50,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) => Icon(
                                  Icons.broken_image,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                          ),
                          title: Text(
                            movie.title,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          subtitle: Text(
                            "⭐ ${movie.rating} | 📅 ${movie.releaseDate}",
                            style: TextStyle(color: Colors.grey),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        MovieDetailsScreen(movie: movie),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )
                else
                  /// 🏠 Default Movie List (Carousel + Genre Categories)
                  Expanded(
                    child: Column(
                      children: [
                        MovieCarousel(
                          movies: movieProvider.movies,
                          onMovieTap: (movie) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        MovieDetailsScreen(movie: movie),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            children:
                                movieProvider.moviesByGenre.entries.map((
                                  entry,
                                ) {
                                  return MovieGenreList(
                                    genre: entry.key,
                                    movies: entry.value,
                                  );
                                }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
