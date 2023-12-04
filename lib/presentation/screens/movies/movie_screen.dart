import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';


class MovieScreen extends ConsumerStatefulWidget {

  static const name = "movie-screen";
  final String movieId;

  const MovieScreen({
    super.key, 
    required this.movieId
  });

  @override
  // ConsumerState<MovieScreen> createState() => MovieScreenState();
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(movieDetailsProvider.notifier).loadMovie(widget.movieId);

  }

  @override
  Widget build(BuildContext context) {

    final Movie? movie= ref.watch(movieDetailsProvider)[widget.movieId];

    if (movie==null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(strokeWidth: 2)));
    }

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          _CustomSliverAppbar(movie: movie),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => _MovieDetailsView(movie: movie),
            childCount: 1,
          ))
        ],
      ),
    );
  }
}

class _MovieDetailsView extends StatelessWidget {

  final Movie movie;

  const _MovieDetailsView({required this.movie});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              //imagen
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  width: size.width*0.3,
                ),
              ),

              const SizedBox(width: 10),

              //Descripción

              SizedBox(
                width: (size.width-40)*0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title, style: textTheme.titleLarge),
                    const SizedBox(height: 1),
                    Text(movie.overview),
                  ],
                ),
              ),

            ],
          ),
        ),

        //Generos de la pelicula
        Padding(
          padding: EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...movie.genreIds.map((genre) => Container(
                margin: const EdgeInsets.only(right: 10),
                child: Chip(
                  // labelPadding: const EdgeInsets.all(3),77
                  visualDensity: const VisualDensity(horizontal: 2),
                  label: Text(genre),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ))
            ],
          ), 
        ),

        //todo: mostrar actores listview

        const SizedBox(height: 100),

      ],
    );
  }
}

class _CustomSliverAppbar extends StatelessWidget {

  final Movie movie;

  const _CustomSliverAppbar({
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height*0.7,
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 17,vertical: 7),
        title: Text(
          movie.title, 
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.start,
        ),
        background: _CustomBackground(movie: movie),
      ),
    );
  }
}

class _CustomBackground extends StatelessWidget {
  const _CustomBackground({
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
    
        SizedBox.expand(
          child: Image.network(
            movie.posterPath,
            fit: BoxFit.cover,
          ),
        ),
    
        const SizedBox.expand(
          child: DecoratedBox(
            decoration:BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0,0.3],
                colors:[
                  Colors.black87,
                  Colors.transparent,
                ] 
              )
            ) 
          ),
        ),
    
        const SizedBox.expand(
          child: DecoratedBox(
            decoration:BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                stops: [0,0.3],
                colors:[
                  Colors.black87,
                  Colors.transparent,
                ] 
              )
            ) 
          ),
        ),
    
      ],
    );
  }
}