import 'package:flutter/material.dart';

import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  static const name = "home-screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView()
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

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies= ref.watch(nowPlayingMoviesProvider);

    // if (nowPlayingMovies.isEmpty) const Center(child: CircularProgressIndicator());

    return Column(
      children: [

        CustomAppbar(),

        Expanded(
          child: ListView.builder(
          itemCount: nowPlayingMovies.length,
            itemBuilder: (context, index){
              final movie = nowPlayingMovies[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                title: Text(movie.title),
                onTap: () {},
                leading: SizedBox(width: 70,height: 70,child: Image.network(movie.posterPath, fit: BoxFit.fitWidth)),
              );
            },
          ),
        )

      ],
    );
  }
}