import 'package:cinemapedia/domain/entities/actor.dart';



abstract class IActorsRepository {
  
  Future<List<Actor>> getActorByMovie(String movieId);

}