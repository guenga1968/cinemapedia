import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import '../../../domain/entities/movie.dart';

final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);

  if(nowPlayingMovies.isEmpty) return[];
  return nowPlayingMovies.sublist(0,6);
});