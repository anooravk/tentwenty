import 'dart:convert';

GenreModel genreModelFromJson(String str) => GenreModel.fromJson(json.decode(str));

String genreModelToJson(GenreModel data) => json.encode(data.toJson());

class GenreModel {
  List<Genre>? genres;

  GenreModel({
    this.genres,
  });

  GenreModel copyWith({
    List<Genre>? genres,
  }) =>
      GenreModel(
        genres: genres ?? this.genres,
      );

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
      };
}

class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) =>
      Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
