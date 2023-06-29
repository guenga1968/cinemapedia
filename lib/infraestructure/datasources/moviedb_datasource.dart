import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters:{
        'api_key':Enviroment.theMovieDbKey,
        'language': 'es-MX'
      } ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing',
    queryParameters: {
      'page': page,
    }
    );

    final moviedbResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviedbResponse.results
    //where para que no se muestren las películas sin poster
    .where((moviedb) => moviedb.posterPath !='no-poster')
    .map((moviedb) => MovieMapper.moviedbToEntity(moviedb)).toList();
    
    return movies;
  }
}
