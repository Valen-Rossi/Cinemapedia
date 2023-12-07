import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {

  final SearchMoviesCallBack searchMovies;
  List<Movie> initialSearchedMovies;

  StreamController<List<Movie>> debouncedMovies= StreamController.broadcast();
  StreamController<bool> isLoadingStream= StreamController.broadcast();
  
  Timer? _debounceTimer;

  SearchMovieDelegate({
    required this.initialSearchedMovies,
    required this.searchMovies
  }):super(
    searchFieldLabel: 'Buscar películas',
  );

  void clearStreams() {
    _debounceTimer?.cancel();
    debouncedMovies.close();
    isLoadingStream.close();
  }

  void _onQueryChanged(String query){

    isLoadingStream.add(true);

    if(_debounceTimer?.isActive?? false) {
      _debounceTimer!.cancel();
    }
    
    _debounceTimer= Timer(const Duration(milliseconds: 500), () async{ 
      final movies= await searchMovies(query);
      initialSearchedMovies= movies;
      debouncedMovies.add(movies);
      isLoadingStream.add(false);

    });

  }

  Widget buildResultsAndSuggestions(){

    return StreamBuilder(
      initialData: initialSearchedMovies,
      stream: debouncedMovies.stream,
      builder: (context, snapshot){

        final movies= snapshot.data?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(movie: movies[index]),
        );
      }
    );

  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          return FadeIn(
            animate: query.isNotEmpty,
            // duration: const Duration(milliseconds: 200),
            child: IconButton(
              onPressed: () => query= '', 
              icon: snapshot.data??false ?SpinPerfect(
                duration: const Duration(seconds: 2),
                infinite: true,
                child: const Icon(Icons.refresh_rounded ),
              )
              : const Icon(Icons.clear_rounded),
            ),
          );
        }
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

    return buildResultsAndSuggestions();

  }

  @override
  Widget buildSuggestions(BuildContext context) {

    //eliminar
    _onQueryChanged(query);

    return buildResultsAndSuggestions();

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