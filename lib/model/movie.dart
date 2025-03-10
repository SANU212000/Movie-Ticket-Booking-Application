class Movie {
  final String title;
  final String posterUrl;
  final double rating;
  final String releaseDate;
  final String synopsis;
  final List<String> genres; 

  Movie({
    required this.title,
    required this.posterUrl,
    required this.rating,
    required this.releaseDate,
    required this.synopsis,
    required this.genres,
  });
}
