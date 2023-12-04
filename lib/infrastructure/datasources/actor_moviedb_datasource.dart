import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';


class ActorMovieDbDatasource extends IActorsDatasource {
 
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/movie',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX',
    },
  ));

  List<Actor> _jsonToActor(Map<String,dynamic> json){

    final creditsResponse= CreditsResponse.fromJson(json);

    final List<Actor> actors= creditsResponse.cast
      .map((cast) => ActorMapper.castToEntity(cast)).toList();

    return actors;
  }
 
  @override
  Future<List<Actor>> getActorByMovie(String movieId) async{
   
   final response = await dio.get('/$movieId/credits');

   return _jsonToActor(response.data);
  }
  
}