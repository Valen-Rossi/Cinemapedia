import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {

  bool isLoading= false;
  bool isLastPage= false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async{

    if (isLoading || isLastPage) return;

    isLoading= true;

    final movies = await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    
    isLoading= false;

    if (movies.isEmpty) {
      isLastPage= true;
    }
  }

  @override
  Widget build(BuildContext context) {

    final List<Movie> favoritesMovies= ref.watch(favoriteMoviesProvider).values.toList();

    if (favoritesMovies.isEmpty) {
      final colorsTheme = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(Icons.favorite_border_rounded, size: 47, color: colorsTheme.primary,),
            Text('Ups! No hay Favoritos', style: TextStyle(fontSize: 22, color: colorsTheme.primary),),
            const Text('Intenta añadir alguna', style: TextStyle(fontSize: 17, color: Colors.black45,)),

            const SizedBox(height: 20,),
            FilledButton.tonal(
              onPressed: () => context.go('/'), 
              child: const Text('Ir al inicio')
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: MovieMasonry(
        loadNextPage: loadNextPage,
        movies: favoritesMovies
      )
    );
  }
}