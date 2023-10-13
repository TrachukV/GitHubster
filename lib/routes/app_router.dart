import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:githubster/pages/favorite_page/favorite_page.dart';
import 'package:githubster/pages/search_page/search_page.dart';
import 'package:githubster/pages/splash_screen/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final bool isIos = Platform.isIOS;
    log('⤴️ ${settings.name}');
    switch (settings.name) {
      case SplashScreen.routeName:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          isIos: isIos,
        );
      case SearchPage.routeName:
        return PageTransition(
          child: const SearchPage(),
          type: PageTransitionType.rightToLeft,
          isIos: isIos,
        );
      case FavoritesPage.routeName:
        return PageTransition(
          child: const FavoritesPage(),
          type: PageTransitionType.rightToLeft,
          isIos: isIos,
        );
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }
}
