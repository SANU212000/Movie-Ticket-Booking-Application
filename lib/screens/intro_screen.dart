import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_listing_app/utils/intro_screen_drawing.dart';
import 'package:provider/provider.dart';
import 'package:movie_listing_app/screens/movie_listing_screen.dart';
import 'package:movie_listing_app/provider/movie_provider.dart';
import 'package:movie_listing_app/utils/squre_box.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;
  double _textPosition = 50;
  double _boxPosition = -100;
  double _whiteOverlayOpacity = 0.0; // Overlay opacity
  final double _arcTop = 1;
  bool _showLottie = false;

  @override
  void initState() {
    super.initState();
    _showLottieWithDelay();
    _startAnimations();
    _loadDataAndNavigate();
  }

  void _showLottieWithDelay() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _showLottie = true;
      });
    });
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _opacity = 1.0;
        _textPosition = 0;
        _boxPosition = 0;
      });
    });
  }

  Future<void> _loadDataAndNavigate() async {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    try {
      await movieProvider.loadMovies(context);
      final imagePreloadTasks =
          movieProvider.movies.map((movie) async {
            if (movie.posterUrl.isNotEmpty) {
              final image = Image.network(movie.posterUrl).image;
              return precacheImage(image, context);
            }
          }).toList();
      await Future.wait(imagePreloadTasks);

      if (mounted) {
        setState(() {
          _opacity = 0.0;
          _textPosition = 50;
          _boxPosition = 100;
        });

        await Future.delayed(const Duration(milliseconds: 300));

        // 🔥 Animate white overlay before navigating
        setState(() {
          _whiteOverlayOpacity = 1.0;
        });

        await Future.delayed(const Duration(milliseconds: 500));

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder:
                (context, animation, secondaryAnimation) =>
                    const MovieListScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      }
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOut,
            top: _arcTop,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: ArcPainter(),
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height / 1.2,
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            top: MediaQuery.of(context).size.height / 2 + _boxPosition,
            left: MediaQuery.of(context).size.width / 2 - 200,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _opacity,
              child: SquareWithConnectedBoxes(size: 500),
            ),
          ),

          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _opacity,
              child: Lottie.asset(
                'assets/animated icons/tickets.json',
                width: 350,
                height: 350,
                repeat: true,
                reverse: true,
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            bottom: 110 - _textPosition,
            left: 30,
            right: 30,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _opacity,
              child: Column(
                children: [
                  Text(
                    'Skip the Queue, Grab Your Seat!',
                    style: GoogleFonts.dmSans(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_showLottie)
                    AnimatedOpacity(
                      duration: const Duration(
                        milliseconds: 1000,
                      ), // Fade-in effect
                      opacity: 1,
                      child: Lottie.asset(
                        "assets/animated icons/Loading.json",
                        width: 80,
                      ),
                    ),
                ],
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: _whiteOverlayOpacity,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
