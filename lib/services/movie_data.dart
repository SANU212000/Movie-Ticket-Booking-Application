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
        duration: "2h 49m",
        userScore: 86,
        overview:
            "A team of explorers travels through a wormhole in space in an attempt to ensure humanity's survival.",
        synopsis:
            "Earth is on the brink of collapse, and a team of astronauts embarks on a journey through a wormhole to find a new habitable planet.",
        genres: ["Sci-Fi", "Adventure"],
        director: "Christopher Nolan",
        screenplay: "Jonathan Nolan",
      ),
      Movie(
        title: "The Dark Knight",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
        rating: 9.0,
        releaseDate: "2008-07-18",
        duration: "2h 32m",
        userScore: 90,
        overview:
            "Batman faces the Joker, a criminal mastermind who causes chaos in Gotham City.",
        synopsis:
            "With Gotham facing chaos, Batman must stop the Joker, a maniacal villain determined to bring the city to its knees.",
        genres: ["Action", "Crime", "Drama"],
        director: "Christopher Nolan",
        screenplay: "Jonathan Nolan, Christopher Nolan, David S. Goyer",
      ),
      Movie(
        title: "Avatar",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/kyeqWdyUXW608qlYkRqosgbbJyK.jpg",
        rating: 7.8,
        releaseDate: "2009-12-18",
        duration: "2h 42m",
        userScore: 78,
        overview:
            "A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following orders and protecting an alien civilization.",
        synopsis:
            "Jake Sully, a paraplegic ex-Marine, joins the Avatar Program on Pandora but finds himself caught between two worlds.",
        genres: ["Sci-Fi", "Adventure"],
        director: "James Cameron",
        screenplay: "James Cameron",
      ),
      Movie(
        title: "Titanic",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
        rating: 7.8,
        releaseDate: "1997-12-19",
        duration: "3h 14m",
        userScore: 78,
        overview:
            "A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.",
        synopsis:
            "Jack and Rose, from different social classes, fall in love aboard the doomed R.M.S. Titanic.",
        genres: ["Romance", "Drama"],
        director: "James Cameron",
        screenplay: "James Cameron",
      ),
      Movie(
        title: "The Matrix",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
        rating: 8.7,
        releaseDate: "1999-03-31",
        duration: "2h 16m",
        userScore: 87,
        overview:
            "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
        synopsis:
            "Neo, a skilled hacker, discovers the shocking truth about the world and his role in humanity’s fight for survival.",
        genres: ["Sci-Fi", "Action"],
        director: "Lana Wachowski, Lilly Wachowski",
        screenplay: "Lana Wachowski, Lilly Wachowski",
      ),
      Movie(
        title: "Joker",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
        rating: 8.4,
        releaseDate: "2019-10-04",
        duration: "2h 2m",
        userScore: 84,
        overview:
            "A mentally troubled stand-up comedian embarks on a downward spiral that leads to the creation of an iconic villain.",
        synopsis:
            "Arthur Fleck, a struggling comedian, descends into madness and becomes the infamous Joker.",
        genres: ["Drama", "Thriller"],
        director: "Todd Phillips",
        screenplay: "Todd Phillips, Scott Silver",
      ),
      Movie(
        title: "Avengers: Endgame",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
        rating: 8.4,
        releaseDate: "2019-04-26",
        duration: "3h 1m",
        userScore: 84,
        overview:
            "After the devastating events of Avengers: Infinity War, the universe is in ruins. The remaining Avengers assemble for one last stand.",
        synopsis:
            "The surviving Avengers band together to undo the devastation caused by Thanos.",
        genres: ["Action", "Adventure"],
        director: "Anthony Russo, Joe Russo",
        screenplay: "Christopher Markus, Stephen McFeely",
      ),
      Movie(
        title: "Dune",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
        rating: 8.3,
        releaseDate: "2021-10-22",
        duration: "2h 35m",
        userScore: 83,
        overview:
            "A noble family becomes embroiled in a war for control over the galaxy’s most valuable asset while its heir is troubled by visions of the future.",
        synopsis:
            "Paul Atreides, a gifted young man, must navigate treachery and fate on the desert planet Arrakis.",
        genres: ["Sci-Fi", "Adventure"],
        director: "Denis Villeneuve",
        screenplay: "Jon Spaihts, Denis Villeneuve, Eric Roth",
      ),
      Movie(
        title: "Parasite",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg",
        rating: 8.6,
        releaseDate: "2019-05-30",
        synopsis:
            "A poor family schemes to become employed by a wealthy family and infiltrate their household.",
        genres: ["Drama", "Thriller"],
        duration: "132 min",
        userScore: 86,
        overview:
            "A genre-bending social satire that won the Oscar for Best Picture.",
        director: "Bong Joon-ho",
        screenplay: "Bong Joon-ho, Han Jin-won",
      ),

      Movie(
        title: "The Godfather",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        rating: 9.2,
        releaseDate: "1972-03-24",
        synopsis:
            "The aging patriarch of an organized crime dynasty transfers control to his reluctant son.",
        genres: ["Crime", "Drama"],
        duration: "175 min",
        userScore: 92,
        overview: "A masterpiece depicting the rise of a mafia family.",
        director: "Francis Ford Coppola",
        screenplay: "Mario Puzo, Francis Ford Coppola",
      ),
      Movie(
        title: "Fight Club",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
        rating: 8.8,
        releaseDate: "1999-10-15",
        synopsis:
            "An insomniac office worker forms an underground fight club with a soap salesman.",
        genres: ["Drama"],
        duration: "139 min",
        userScore: 88,
        overview: "An anti-establishment psychological drama.",
        director: "David Fincher",
        screenplay: "Jim Uhls",
      ),

      Movie(
        title: "The Green Mile",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/8VG8fDNiy50H4FedGwdSVUPoaJe.jpg",
        rating: 8.6,
        releaseDate: "1999-12-10",
        synopsis:
            "A death row corrections officer forms a bond with a gentle giant with a mysterious gift.",
        genres: ["Fantasy", "Drama", "Crime"],
        duration: "189 min",
        userScore: 86,
        overview: "A heart-touching supernatural drama.",
        director: "Frank Darabont",
        screenplay: "Frank Darabont",
      ),
      Movie(
        title: "Schindler's List",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/c8Ass7acuOe4za6DhSattE359gr.jpg",
        rating: 9.0,
        releaseDate: "1993-12-15",
        synopsis:
            "The true story of a man who saved over a thousand Jews during the Holocaust.",
        genres: ["History", "Drama", "War"],
        duration: "195 min",
        userScore: 90,
        overview: "A harrowing yet inspiring tale of sacrifice.",
        director: "Steven Spielberg",
        screenplay: "Steven Zaillian",
      ),
      Movie(
        title: "The Shawshank Redemption",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
        rating: 9.3,
        releaseDate: "1994-09-23",
        synopsis:
            "Two imprisoned men bond over years, finding solace and redemption.",
        genres: ["Drama"],
        duration: "142 min",
        userScore: 93,
        overview: "A moving story of hope and friendship.",
        director: "Frank Darabont",
        screenplay: "Frank Darabont",
      ),
      Movie(
        title: "Gladiator",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg",
        rating: 8.5,
        releaseDate: "2000-05-05",
        synopsis:
            "A former Roman General seeks revenge against the corrupt emperor who murdered his family.",
        genres: ["Action", "Drama"],
        duration: "155 min",
        userScore: 85,
        overview: "An epic historical drama with intense battle sequences.",
        director: "Ridley Scott",
        screenplay: "David Franzoni, John Logan, William Nicholson",
      ),
      Movie(
        title: "The Matrix",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
        rating: 8.7,
        releaseDate: "1999-03-31",
        synopsis:
            "A hacker learns the shocking truth about reality and joins a rebellion against the system.",
        genres: ["Sci-Fi", "Action"],
        duration: "136 min",
        userScore: 87,
        overview: "A cyberpunk classic that changed sci-fi cinema forever.",
        director: "Lana Wachowski, Lilly Wachowski",
        screenplay: "Lana Wachowski, Lilly Wachowski",
      ),
      Movie(
        title: "The Silence of the Lambs",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/uS9m8OBk1A8eM9I042bx8XXpqAq.jpg",
        rating: 8.6,
        releaseDate: "1991-02-14",
        synopsis:
            "A young FBI agent seeks the help of a brilliant, imprisoned cannibalistic serial killer.",
        genres: ["Crime", "Drama", "Thriller"],
        duration: "118 min",
        userScore: 86,
        overview: "A chilling psychological thriller with iconic performances.",
        director: "Jonathan Demme",
        screenplay: "Ted Tally",
      ),

      Movie(
        title: "Spider-Man: Across the Spider-Verse",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
        rating: 8.8,
        releaseDate: "2023-06-02",
        synopsis:
            "Miles Morales embarks on an adventure across the multiverse.",
        genres: ["Animation", "Action", "Adventure"],
        duration: "140 min",
        userScore: 88,
        overview:
            "A visually stunning and heartwarming journey across the Spider-Verse.",
        director: "Joaquim Dos Santos, Kemp Powers, Justin K. Thompson",
        screenplay: "Phil Lord, Christopher Miller, Dave Callaham",
      ),
      Movie(
        title: "The Whale",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/jQ0gylJMxWSL490sy0RrPj1Lj7e.jpg",
        rating: 8.0,
        releaseDate: "2022-12-09",
        synopsis:
            "A reclusive English teacher living with severe obesity attempts to reconnect with his estranged daughter.",
        genres: ["Drama"],
        duration: "117 min",
        userScore: 80,
        overview:
            "A powerful drama about love, redemption, and second chances.",
        director: "Darren Aronofsky",
        screenplay: "Samuel D. Hunter",
      ),

      Movie(
        title: "Nope",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/AcKVlWaNVVVFQwro3nLXqPljcYA.jpg",
        rating: 7.5,
        releaseDate: "2022-07-22",
        synopsis:
            "Residents of a remote town witness a mysterious and otherworldly event.",
        genres: ["Horror", "Sci-Fi", "Thriller"],
        duration: "130 min",
        userScore: 75,
        overview:
            "A unique horror mystery that blends sci-fi with social commentary.",
        director: "Jordan Peele",
        screenplay: "Jordan Peele",
      ),
      Movie(
        title: "Barbie",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
        rating: 7.8,
        releaseDate: "2023-07-21",
        synopsis:
            "After being expelled from Barbieland, Barbie embarks on a journey of self-discovery.",
        genres: ["Comedy", "Adventure", "Fantasy"],
        duration: "114 min",
        userScore: 78,
        overview:
            "A fun, vibrant, and thought-provoking take on the iconic character.",
        director: "Greta Gerwig",
        screenplay: "Greta Gerwig, Noah Baumbach",
      ),
      Movie(
        title: "The Batman",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/74xTEgt7R36Fpooo50r9T25onhq.jpg",
        rating: 8.2,
        releaseDate: "2022-03-04",
        synopsis:
            "Batman ventures into Gotham's criminal underworld when a sadistic killer leaves behind a trail of cryptic clues.",
        genres: ["Action", "Crime", "Mystery"],
        duration: "176 min",
        userScore: 82,
        overview: "A dark, gritty, and compelling take on the caped crusader.",
        director: "Matt Reeves",
        screenplay: "Matt Reeves, Peter Craig",
      ),
      Movie(
        title: "Dungeons & Dragons: Honor Among Thieves",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/v7UF7ypAqjsFZFdjksjQ7IUpXdn.jpg",
        rating: 7.3,
        releaseDate: "2023-03-31",
        synopsis:
            "A charming thief and a band of adventurers embark on an epic quest to retrieve a lost relic.",
        genres: ["Fantasy", "Adventure", "Comedy"],
        duration: "134 min",
        userScore: 73,
        overview:
            "A thrilling and humorous adventure set in a beloved fantasy world.",
        director: "Jonathan Goldstein, John Francis Daley",
        screenplay: "Jonathan Goldstein, John Francis Daley, Michael Gilio",
      ),
      Movie(
        title: "Mission: Impossible – Dead Reckoning Part One",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/NNxYkU70HPurnNCSiCjYAmacwm.jpg",
        rating: 8.1,
        releaseDate: "2023-07-12",
        synopsis:
            "Ethan Hunt and his team must track down a terrifying new weapon before it falls into the wrong hands.",
        genres: ["Action", "Adventure", "Thriller"],
        duration: "163 min",
        userScore: 81,
        overview:
            "A pulse-pounding espionage thriller with jaw-dropping stunts.",
        director: "Christopher McQuarrie",
        screenplay: "Christopher McQuarrie, Erik Jendresen",
      ),
      Movie(
        title: "Black Panther: Wakanda Forever",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/ps2oKfhY6DL3alynlSqY97gHSsg.jpg",
        rating: 7.1,
        releaseDate: "2022-11-11",
        synopsis:
            "The leaders of Wakanda fight to protect their nation after the death of King T'Challa.",
        genres: ["Action", "Adventure", "Sci-Fi"],
        duration: "161 min",
        userScore: 71,
        overview:
            "A heartfelt sequel that expands the legacy of Black Panther.",
        director: "Ryan Coogler",
        screenplay: "Ryan Coogler, Joe Robert Cole",
      ),
      Movie(
        title: "La La Land",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/uDO8zWDhfWwoFdKS4fzkUJt0Rf0.jpg",
        rating: 8.0,
        releaseDate: "2016-12-09",
        synopsis:
            "A jazz musician and an aspiring actress fall in love while pursuing their dreams.",
        genres: ["Romance", "Drama", "Music"],
        duration: "128 min",
        userScore: 80,
        overview: "A beautifully shot modern musical about love and ambition.",
        director: "Damien Chazelle",
        screenplay: "Damien Chazelle",
      ),
      Movie(
        title: "The Notebook",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/rNzQyW4f8B8cQeg7Dgj3n6eT5k9.jpg",
        rating: 7.9,
        releaseDate: "2004-06-25",
        synopsis:
            "A young couple falls deeply in love, but fate and class differences pull them apart.",
        genres: ["Romance", "Drama"],
        duration: "123 min",
        userScore: 79,
        overview: "A heartbreaking love story based on Nicholas Sparks' novel.",
        director: "Nick Cassavetes",
        screenplay: "Jeremy Leven, Jan Sardi",
      ),

      Movie(
        title: "A Star is Born",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/wrFpXMNBRj2PBiN4Z5kix51XaIZ.jpg",
        rating: 7.6,
        releaseDate: "2018-10-05",
        synopsis:
            "A famous musician helps a young singer rise to fame as his own career declines.",
        genres: ["Romance", "Drama", "Music"],
        duration: "136 min",
        userScore: 76,
        overview: "A moving story of love, music, and personal struggles.",
        director: "Bradley Cooper",
        screenplay: "Eric Roth, Bradley Cooper, Will Fetters",
      ),

      Movie(
        title: "To All the Boys I've Loved Before",
        posterUrl:
            "https://image.tmdb.org/t/p/w500/hKHZhUbIyUAjcSrqJThFGYIR6kI.jpg",
        rating: 7.2,
        releaseDate: "2018-08-17",
        synopsis:
            "A teenage girl's secret love letters are accidentally sent out to her crushes.",
        genres: ["Romance", "Comedy"],
        duration: "99 min",
        userScore: 72,
        overview: "A charming high school love story filled with surprises.",
        director: "Susan Johnson",
        screenplay: "Sofia Alvarez",
      ),
    ];
  }
}
