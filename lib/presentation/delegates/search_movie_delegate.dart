import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMoviesCallBack searchMovies;
  StreamController<List<Movie>> debouncedMovies= StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({required this.searchMovies});

  void clearStreams() {
    _debounceTimer?.cancel();
    debouncedMovies.close();
  }

  void _onQueryChanged(String query){

    if(_debounceTimer?.isActive?? false) _debounceTimer!.cancel();
    
    _debounceTimer= Timer(const Duration(milliseconds: 500), () async{ 
      if (query.isEmpty) {
        debouncedMovies.add([]);
        return;
      }
    
      final movies= await searchMovies(query);
      debouncedMovies.add(movies);

    });

  }

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      
      FadeIn(
        animate: query.isNotEmpty,
        // duration: const Duration(milliseconds: 200),
        child: IconButton(
          onPressed: () => query= '', 
          icon: const Icon(Icons.clear_rounded)
        ),
      ),

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        clearStreams();
        close(context, null);
      }, 
      icon: const Icon(Icons.arrow_back_ios_rounded)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Build Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    //eliminar
    _onQueryChanged(query);

    //FutureBuilder()
    return StreamBuilder(
      // future: searchMovies(query), 
      stream: debouncedMovies.stream,
      builder: (context, snapshot){

        // print('Haciendo Petición');

        final movies= snapshot.data?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(movie: movies[index]),
        );
      }
    );
  }
  
}

class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    
    final textTheme= Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => context.push('/movie/${movie.id}'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
      
            //image
            SizedBox(
              width: size.width*0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress)=> FadeIn(child: child),
                ),
              ),
            ),
      
            //description
            const SizedBox(width: 10),
      
            SizedBox(
              width: size.width*0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textTheme.titleMedium,),
      
                  Text(movie.overview, maxLines: 4, overflow: TextOverflow.ellipsis),
      
                  Row(
                    children: [
                      Icon(Icons.star_half_rounded, color: Colors.yellow.shade800),
                      Text(movie.voteAverage.toStringAsFixed(1), style: TextStyle(color: Colors.yellow.shade900),)
                    ],
                  )
                ],
              ),
            )
      
      
          ],
        )
      ),
    );
  }
}