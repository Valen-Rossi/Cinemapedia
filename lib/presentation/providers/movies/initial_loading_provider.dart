import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {

  // final nowPlayingMovies= ref.watch(nowPlayingMoviesProvider).isEmpty;
  // final popularMovies= ref.watch(popularMoviesProvider).isEmpty;
  // final upcomingMovies= ref.watch(upcomingMoviesProvider).isEmpty;
  // final topRatedMovies= ref.watch(topRatedMoviesProvider).isEmpty;

  // if (nowPlayingMovies || popularMovies || upcomingMovies || topRatedMovies) return true;

  // return false; //terminamos de cargar
  final moviesProviders=[
    ref.watch(nowPlayingMoviesProvider),
    ref.watch(popularMoviesProvider),
    ref.watch(upcomingMoviesProvider),
    ref.watch(topRatedMoviesProvider),
  ];

  return moviesProviders.any((movies) => movies.isEmpty);
});