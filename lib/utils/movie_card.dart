import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({Key? key, required this.movie, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(movie.posterUrl, width: 50, fit: BoxFit.cover),
        title: Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("⭐ ${movie.rating}  |  📅 ${movie.releaseDate}"),
        onTap: onTap,
      ),
    );
  }
}
