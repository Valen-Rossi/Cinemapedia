import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = "home-screen";
  final StatefulNavigationShell childView;

  const HomeScreen({
    super.key, 
    required this.childView
  });

  @override
  Widget build(BuildContext context) {

    final location= GoRouter.of(context).location();

    return Scaffold(
      body: childView,
      bottomNavigationBar: location.startsWith('/movie') 
      ? null 
      : CustomBottomNavigation(childView: childView),
    );
  }
}

//eliminar todo esto y la condicion de location en caso de querer otro funcionamiento

extension GoRouterExtension on GoRouter {

  String location() {

    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;

    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch ? lastMatch.matches : routerDelegate.currentConfiguration;

    final String location = matchList.uri.toString();

    return location;

  }

}