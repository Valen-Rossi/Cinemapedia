import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';


class MovieHorizontalListview extends StatelessWidget {

  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key, 
    required this.movies, 
    this.title, 
    this.subTitle, 
    this.loadNextPage
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          
          if (title!= null || subTitle!= null)
            _Title(title: title, subTitle: subTitle),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                
              }
            ) 
          ),

        ],
      ),
    );
  }
}


class _Title extends StatelessWidget {

  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {

    final textTheme= Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          
          if(title!=null)
            Text(title!, style: textTheme.titleLarge,),
          
          const Spacer(),

          if(subTitle!=null)
            FilledButton.tonal(
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact
              ),
              onPressed: () {},
              child: Text(subTitle!),
            ),


        ],
      ),
    );
  }
}