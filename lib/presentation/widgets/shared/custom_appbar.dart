import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final colorsTheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colorsTheme.primary),
                const SizedBox(width: 20,),
                Text('Cinemapedia', style: textTheme.titleMedium,),

                IconButton(
                  onPressed: () {}, 
                  icon: const Icon(Icons.search_outlined)
                )

              ],
            )
          ),
        )
    );
  }
}