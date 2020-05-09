import 'package:fluttermovieapp/model/movie.dart';

class MovieResponse{
  final List<Movie> movies;
  final String error;

  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json):
      movies = (json["result"] as List).map((e) => new Movie.fromJson(e)).toList(),
      error = "";
  MovieResponse.withError(String value):
      movies = List(),
      error = value;
}