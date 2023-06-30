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


  List<Movie> _jsonToMovies(Map<String, dynamic> json){

    final moviedbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = moviedbResponse.results
    //where para que no se muestren las películas sin poster
    .where((moviedb) => moviedb.posterPath !='no-poster')
    .map((moviedb) => MovieMapper.moviedbToEntity(moviedb)).toList();
    
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing',
    queryParameters: {
      'page': page,
    }
    );

    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', 
    queryParameters: {
      'page':page,
    });

   return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', 
    queryParameters: {
      'page':page,
    });

   return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', 
    queryParameters: {
      'page':page,
    });

   return _jsonToMovies(response.data);
  }

}
