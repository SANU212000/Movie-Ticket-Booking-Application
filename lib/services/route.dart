import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_listing_app/screens/intro_screen.dart';
import 'package:movie_listing_app/screens/movie_details_screen.dart';
import 'package:movie_listing_app/screens/movie_listing_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(
      path: '/movieListScreen',
      builder: (context, state) => MovieListScreen(),
    ),
    GoRoute(
      path: '/movieDetailsScreen/:id',
      builder: (context, state) {
        final idParam = state.pathParameters['id'];
        log('Received movie ID: $idParam');

        if (idParam == null) {
          return Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(child: Text('Movie ID not found')),
          );
        }

        final movieId = int.tryParse(idParam);
        log('movie id :$movieId');
        if (movieId == null) {
          return Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(child: Text('Invalid movie ID format')),
          );
        }

        return MovieDetailsScreen(movieId: movieId);
      },
    ),
  ],
);
