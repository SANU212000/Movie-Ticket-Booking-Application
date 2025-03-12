class Movie {
  final String title;
  final String posterUrl;
  final double rating;
  final String releaseDate;
  final String synopsis;
  final List<String> genres;
  final String duration;
  final int userScore;
  final String overview;
  final String director;
  final String screenplay;

  Movie({
    required this.title,
    required this.posterUrl,
    required this.rating,
    required this.releaseDate,
    required this.synopsis,
    required this.genres,
    required this.duration,
    required this.userScore,
    required this.overview,
    required this.director,
    required this.screenplay,
  });
}
