class MovieModel {
  String id;
  List<String> director;
  List<String> writers;
  List<String> stars;
  int releasedDate;
  List<String> productionCompany;
  String title;
  String language;
  dynamic runTime;
  String genre;
  List<Voted> voted;
  String poster;
  int pageViews;
  String description;
  List<String> upVoted;
  List<String> downVoted;
  int totalVoted;
  int voting;

  MovieModel({
    required this.id,
    required this.director,
    required this.writers,
    required this.stars,
    required this.releasedDate,
    required this.productionCompany,
    required this.title,
    required this.language,
    required this.runTime,
    required this.genre,
    required this.voted,
    required this.poster,
    required this.pageViews,
    required this.description,
    required this.upVoted,
    required this.downVoted,
    required this.totalVoted,
    required this.voting,
  });
  factory MovieModel.fromJson(Map json) => MovieModel(
        id: json["_id"],
        director: List.from(json["director"] ?? []),
        writers: List.from(json["writers"] ?? []),
        stars: List.from(json["stars"] ?? []),
        releasedDate: json["releasedDate"],
        productionCompany: List.from(json["productionCompany"] ?? []),
        title: json["title"],
        language: json["language"],
        runTime: json["runTime"],
        genre: json["genre"],
        voted: List.from(json["voted"]?.map((x) => Voted.fromJson(x)) ?? []),
        poster: json["poster"],
        pageViews: json["pageViews"],
        description: json["description"],
        upVoted: List.from(json["upVoted"] ?? []),
        downVoted: List.from(json["downVoted"] ?? []),
        totalVoted: json["totalVoted"],
        voting: json["voting"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "director": List<dynamic>.from(director.map((x) => x)),
        "writers": List<dynamic>.from(writers.map((x) => x)),
        "stars": List<dynamic>.from(stars.map((x) => x)),
        "releasedDate": releasedDate,
        "productionCompany":
            List<dynamic>.from(productionCompany.map((x) => x)),
        "title": title,
        "language": language,
        "runTime": runTime,
        "genre": genre,
        "voted": List<dynamic>.from(voted.map((x) => x.toJson())),
        "poster": poster,
        "pageViews": pageViews,
        "description": description,
        "upVoted": List<dynamic>.from(upVoted.map((x) => x)),
        "downVoted": List<dynamic>.from(downVoted.map((x) => x)),
        "totalVoted": totalVoted,
        "voting": voting,
      };
}

class Voted {
  List<String> upVoted;
  List<dynamic> downVoted;
  String id;
  int updatedAt;
  String genre;

  Voted({
    required this.upVoted,
    required this.downVoted,
    required this.id,
    required this.updatedAt,
    required this.genre,
  });

  factory Voted.fromJson(Map<String, dynamic> json) => Voted(
        upVoted: List<String>.from(json["upVoted"].map((x) => x)),
        downVoted: List<dynamic>.from(json["downVoted"].map((x) => x)),
        id: json["_id"],
        updatedAt: json["updatedAt"],
        genre: json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "upVoted": List<dynamic>.from(upVoted.map((x) => x)),
        "downVoted": List<dynamic>.from(downVoted.map((x) => x)),
        "_id": id,
        "updatedAt": updatedAt,
        "genre": genre,
      };
}
