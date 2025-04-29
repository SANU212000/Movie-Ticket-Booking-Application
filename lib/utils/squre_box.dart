import 'package:flutter/material.dart';

class SquareWithConnectedBoxes extends StatelessWidget {
  final double size;

  const SquareWithConnectedBoxes({super.key, this.size = 500.0});

  @override
  Widget build(BuildContext context) {
    int boxesPerRow = 13;
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.001),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.3,
            color: Colors.white.withValues(
              alpha: 0.1,
            ), // Make border more visible
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(10, 2, 2, 0), // More visible
                  Color.fromRGBO(0, 0, 0, 0),
                ],
                stops: [0.0, 1.0],
              ),
            ),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(), // Disable scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: boxesPerRow,
                crossAxisSpacing: 0.5, // Reduced spacing for visibility
                mainAxisSpacing: 0.5,
              ),
              itemCount: 200,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withValues(
                        alpha: 0.08,
                      ), // More visible lines
                      width: 0.8,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
