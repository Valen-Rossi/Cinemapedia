import 'package:cinemapedia/domain/entities/movie.dart';



abstract class IMoviesDataSource {

  Future<List<Movie>> getNowPlaying({int page= 1});
  
  
}