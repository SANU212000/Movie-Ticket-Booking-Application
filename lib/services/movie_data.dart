import 'package:movie_listing_app/model/movie.dart';

class LocalMovieRepository {
  List<Movie> getMovies() {
    return [
      Movie(
        title: "Interstellar",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
        rating: 8.6,
        releaseDate: "2014-11-07",
        synopsis:
            "A team of explorers travels through a wormhole in space in an attempt to ensure humanity's survival.",
        genres: ["Sci-Fi", "Adventure"],
      ),
      Movie(
        title: "The Dark Knight",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
        rating: 9.0,
        releaseDate: "2008-07-18",
        synopsis:
            "Batman faces the Joker, a criminal mastermind who causes chaos in Gotham City.",
        genres: ["Action", "Crime", "Drama"],
      ),
      Movie(
        title: "Avatar",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/kyeqWdyUXW608qlYkRqosgbbJyK.jpg",
        rating: 7.8,
        releaseDate: "2009-12-18",
        synopsis:
            "A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following orders and protecting an alien civilization.",
        genres: ["Sci-Fi", "Adventure"],
      ),
      Movie(
        title: "Titanic",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
        rating: 7.8,
        releaseDate: "1997-12-19",
        synopsis:
            "A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.",
        genres: ["Romance", "Drama"],
      ),
      Movie(
        title: "The Matrix",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
        rating: 8.7,
        releaseDate: "1999-03-31",
        synopsis:
            "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
        genres: ["Sci-Fi", "Action"],
      ),
      Movie(
        title: "Joker",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
        rating: 8.4,
        releaseDate: "2019-10-04",
        synopsis:
            "A mentally troubled stand-up comedian embarks on a downward spiral that leads to the creation of an iconic villain.",
        genres: ["Drama", "Thriller"],
      ),
      Movie(
        title: "Avengers: Endgame",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
        rating: 8.4,
        releaseDate: "2019-04-26",
        synopsis:
            "After the devastating events of Avengers: Infinity War, the universe is in ruins. The remaining Avengers assemble for one last stand.",
        genres: ["Action", "Adventure"],
      ),
      Movie(
        title: "Spider-Man: No Way Home",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/5dExO5G2iaaTxYnLIFKLWofDzyI.jpg",
        rating: 8.3,
        releaseDate: "2021-12-17",
        synopsis:
            "With Spider-Man's identity now revealed, Peter asks Doctor Strange for help, leading to dangerous multiverse consequences.",
        genres: ["Action", "Adventure", "Sci-Fi"],
      ),
      Movie(
        title: "The Wolf of Wall Street",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/sOxr33wnRuKazR9ClHek73T8qnK.jpg",
        rating: 8.2,
        releaseDate: "2013-12-25",
        synopsis:
            "Based on the true story of Jordan Belfort, from his rise to a wealthy stockbroker to his fall involving crime and corruption.",
        genres: ["Comedy", "Drama"],
      ),
      Movie(
        title: "Gladiator",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg",
        rating: 8.5,
        releaseDate: "2000-05-05",
        synopsis:
            "A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery.",
        genres: ["Action", "Drama"],
      ),

      Movie(
        title: "Dune",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
        rating: 8.3,
        releaseDate: "2021-10-22",
        synopsis:
            "A noble family becomes embroiled in a war for control over the galaxy’s most valuable asset while its heir is troubled by visions of the future.",
        genres: ["Sci-Fi", "Adventure"],
      ),

    ];
  }
}
