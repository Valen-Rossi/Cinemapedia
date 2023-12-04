import 'package:cinemapedia/domain/entities/actor.dart';



abstract class IActorsDatasource {
  
  Future<List<Actor>> getActorByMovie(String movieId);

}