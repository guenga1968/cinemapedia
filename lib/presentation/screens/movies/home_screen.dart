


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
     ref.read(popularMoviesProvider.notifier).loadNextPage();
     ref.read(topRatedMoviesProvider.notifier).loadNextPage();
     ref.read(upcomingMoviesPorvider.notifier).loadNextPage();
  }
  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(intialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);
    final slideShowMovie= ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider) ;
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesPorvider);
    
    return CustomScrollView(
      
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
        children: [
    
         
          MoviesSlideshow(movies: slideShowMovie),
          MovieHorizontalListView(
            movies: nowPlayingMovies,
            title: 'En cines',
            subtitle: 'Lunes 20',
            loadNextPage: () => ref.read(nowPlayingMoviesProviders.notifier).loadNextPage(),
            ),
          MovieHorizontalListView(
            movies: upcomingMovies,
            title: 'Proximanete',
            subtitle: 'En este mes',
            loadNextPage: () => ref.read(upcomingMoviesPorvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListView(
            movies: popularMovies,
            title: 'Populares',
            //subtitle: '',
            loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListView(
            movies: topRatedMovies,
            title: 'Mejor Calificadas',
            subtitle: 'Desde siempre',
            loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
            ),
           const  SizedBox(height: 10,),
        ],
      );
          },
          childCount: 1,
          )
        )
      ]
      
    );
  }
}