


import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');



final searchedMoviesProvider = StateNotifierProvider<SearchedMoviesNotifier, List<Movie>>((ref)  {

final movieRepository = ref.read(movieRepositoryProvider);

return SearchedMoviesNotifier(
  ref: ref,
  searchMovies: movieRepository.searchMovies,
);
});


typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends StateNotifier<List<Movie>>{

 final  SearchMoviesCallback searchMovies;
 final Ref ref;

  SearchedMoviesNotifier( {
    required this.searchMovies,
    required this.ref,
  }):super([]); // estado inicial arreglo vacio

  Future <List<Movie>> searchMoviesByQuery(String query)async{

    final List<Movie> movies = await searchMovies(query);

    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = movies;// no hago spread (...movies) porque no quiero las anteriores.
    return movies;
  }

}