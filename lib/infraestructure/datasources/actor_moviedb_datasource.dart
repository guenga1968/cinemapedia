
import 'package:dio/dio.dart';
import '../../config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';




class ActorMoviedbDatasource extends ActorsDatasource {

   final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters:{
        'api_key':Enviroment.theMovieDbKey,
        'language': 'es-MX'
      } ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {

    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map((actor) =>
    ActorMapper.castToEntity(actor)).toList();
  

    return actors;
  }

  


}