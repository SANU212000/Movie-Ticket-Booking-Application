// ignore_for_file: file_names

import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/movie.dart';

class MovieCarousel extends StatelessWidget {
  final List<Movie> movies;
  final Function(Movie) onMovieTap;

  const MovieCarousel({
    super.key,
    required this.movies,
    required this.onMovieTap,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        padEnds: true,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.5,
      ),
      items:
          movies.map((movie) {
            return GestureDetector(
              onTap: () => onMovieTap(movie),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          movie.posterUrl,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Icon(
                                Icons.broken_image,
                                size: 100,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
