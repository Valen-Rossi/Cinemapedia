import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final colorsTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      // bottom: false,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Icon(Icons.movie_outlined, color: colorsTheme.primary),
            const SizedBox(width: 20,),
            Text('Cinemapedia', style: textTheme.titleMedium,),
      
            const Spacer(),
      
            IconButton(
              onPressed: () {

                showSearch(
                  context: context, 
                  delegate: SearchMovieDelegate()
                );

              }, 
              icon: const Icon(Icons.search)
            )
      
          ],
        )
      )
    );
  }
}