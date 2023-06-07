import 'package:flutter_app/models/movie_event.dart';

abstract class MovieApi {
  const MovieApi();
  Future<List<MovieEvent>> getMovies();
}
