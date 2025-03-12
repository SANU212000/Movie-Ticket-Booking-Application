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
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.orange, Colors.black, Colors.black],
              ),
            ),
          ),
          Positioned.fill(
            child: Center(child: SquareWithConnectedBoxes(size: 1000)),
          ),
          SafeArea(
            child: Consumer<MovieProvider>(
              builder: (context, movieProvider, child) {
                bool isSearching = movieProvider.searchQuery.isNotEmpty;

                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: isSearching ? 40 : 420,
                      pinned: true,
                      floating: false,
                      backgroundColor: Colors.transparent,
                      flexibleSpace:
                          isSearching
                              ? null
                              : FlexibleSpaceBar(
                                expandedTitleScale: 1,
                                background: MovieCarousel(
                                  movies: movieProvider.movies,
                                  onMovieTap: (movie) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => MovieDetailsScreen(
                                              movie: movie,
                                            ),
                                      ),
                                    );
                                  },
                                ),
                              ),

                      title: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: SizedBox(
                          height: 70,
                          child: TextField(
                            controller: _searchController,
                            focusNode: _searchFocusNode,
                            decoration: InputDecoration(
                              hintText: "Search movies...",
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.black.withOpacity(0.8),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            onChanged: (query) {
                              movieProvider.updateSearchQuery(query);
                            },
                          ),
                        ),
                      ),
                    ),

                    if (isSearching)
                      SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final movie = movieProvider.movies[index];

                          return ListTile(
                            leading: Image.network(
                              movie.posterUrl,
                              width: 50,
                              fit: BoxFit.fill,
                              errorBuilder:
                                  (context, error, stackTrace) => const Icon(
                                    Icons.broken_image,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                            ),
                            title: Text(
                              movie.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              "⭐ ${movie.rating} | 📅 ${movie.releaseDate}",
                              style: const TextStyle(color: Colors.grey),
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
                        }, childCount: movieProvider.movies.length),
                      )
                    else
                      SliverList(
                        delegate: SliverChildListDelegate(
                          movieProvider.moviesByGenre.entries.map((entry) {
                            return MovieGenreList(
                              genre: entry.key,
                              movies: entry.value,
                            );
                          }).toList(),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
