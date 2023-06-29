
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import '../../widgets/widgets.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

static const String name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProviders.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);
    
    return Column(
      children: [

        CustomAppbar(),
        Expanded(
          child: ListView.builder(
              itemCount: nowPlayingMovies.length,
              itemBuilder:(context, index) {
          final movie = nowPlayingMovies[index];
          return ListTile(
            title: Text(movie.title),
          );
              }, 
            ),
        ),
      ],
    );
  }
}