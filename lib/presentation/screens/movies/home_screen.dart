


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';
import '../../widgets/widgets.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

static const String name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar(),
      );
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

    //final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);
    final slideShowMovie= ref.watch(moviesSlideshowProvider);
    return Column(
      children: [

        const CustomAppbar(),
        MoviesSlideshow(movies: slideShowMovie),
        
      ],
    );
  }
}