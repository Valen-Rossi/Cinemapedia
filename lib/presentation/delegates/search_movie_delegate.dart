import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';


class SearchMovieDelegate extends SearchDelegate<Movie?> {

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      
      IconButton(
        onPressed: () => query= '', 
        icon: const Icon(Icons.search_off_rounded)
      ),

    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: ()=> close(context, null), 
      icon: const Icon(Icons.arrow_back_ios_rounded)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Build Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('Build Suggestions');
  }
  
}