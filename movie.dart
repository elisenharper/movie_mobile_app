class Movie {

  static List<Movie> getMovies() => [
    Movie("Avatar", "2009", "PG-13", "18 Dec 2009", "162 min", "Action, Adventure, Fantasy",
    "James Cameron", "James Cameron", "Sam Worthington, Zoe Saldana, Sigourney Weaver",
    "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn.",
    "English, Spanish",
    "USA, UK",
    "Won 3 Oscars. Another 80 wins & 121 nominations.",
    "images/avatar_poster.jpg",
    "83",
    "7.9",
    "890,617",
    "tt0499549",
    "movie",
    "True", [
      "images/avatar.jpg",
          "images/avatar_pic.jpg"
        ]),

    Movie("Blade Runner", "2009", "PG-13", "18 Dec 2009", "162 min", "Action, Adventure, Fantasy",
        "James Cameron", "James Cameron", "Sam Worthington, Zoe Saldana, Sigourney Weaver",
        "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn.",
        "English, Spanish",
        "USA, UK",
        "Won 3 Oscars. Another 80 wins & 121 nominations.",
        "images/avatar_poster.jpg",
        "83",
        "7.9",
        "890,617",
        "tt0499549",
        "movie",
        "True", [
          "images/avatar.jpg",
          "images/avatar_pic.jpg"
        ]),

    Movie("Titanic", "2009", "PG-13", "18 Dec 2009", "162 min", "Action, Adventure, Fantasy",
        "James Cameron", "James Cameron", "Sam Worthington, Zoe Saldana, Sigourney Weaver",
        "A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn.",
        "English, Spanish",
        "USA, UK",
        "Won 3 Oscars. Another 80 wins & 121 nominations.",
        "images/avatar_poster.jpg",
        "83",
        "7.9",
        "890,617",
        "tt0499549",
        "movie",
        "True", [
          "images/avatar.jpg",
          "images/avatar_pic.jpg"
        ])
  ];

  //Data model
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String type;
  String response;
  List<String> images;

  //Constructor
  Movie(
      this.title,
      this.year,
      this.rated,
      this.released,
      this.runtime,
      this.genre,
      this.director,
      this.writer,
      this.actors,
      this.plot,
      this.language,
      this.country,
      this.awards,
      this.poster,
      this.metascore,
      this.imdbRating,
      this.imdbVotes,
      this.imdbID,
      this.type,
      this.response,
      this.images);

}