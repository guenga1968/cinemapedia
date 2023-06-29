

import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//este repositorio es inmutable la idea es proporcionar a todos los demas providers la información necesaria
final movieRepositoryProvider = Provider((ref) {
  return MovieRespositoryImpl(MoviedbDatasource());
}
);