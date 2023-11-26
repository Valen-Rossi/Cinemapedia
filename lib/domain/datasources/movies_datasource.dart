import 'package:cinemapedia/domain/entities/movie.dart';



abstract class IMovieDataSource {

  Future<List<Movie>> getNowPlaying({int page= 1});
  
  
}