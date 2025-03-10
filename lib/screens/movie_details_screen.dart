import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/movie.dart';
import 'package:movie_listing_app/screens/seat_selection%20_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  void _selectShowTime(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.grey[900],
      builder: (context) {
        return Wrap(
          children: [
            _showTimeTile(context, "Morning Show (10:00 AM)", "Morning"),
            _showTimeTile(context, "Afternoon Show (2:00 PM)", "Afternoon"),
            _showTimeTile(context, "Evening Show (6:00 PM)", "Evening"),
            _showTimeTile(context, "Night Show (9:00 PM)", "Night"),
          ],
        );
      },
    );
  }
  

  Widget _showTimeTile(BuildContext context, String title, String showTime) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () => _navigateToSeatSelection(context, showTime),
    );
  }
  

  void _navigateToSeatSelection(BuildContext context, String showTime) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => SeatSelectionScreen(movie: movie, showTime: showTime),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Hero(
                  tag: movie.title,
                  child: Image.network(movie.posterUrl, fit: BoxFit.cover),
                ),
              ),
            ),

            Positioned(
              top: 40,
              left: 16,
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.4,
              maxChildSize: 0.5,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 40,
                            height: 5,
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "⭐ ${movie.rating}  |  📅 ${movie.releaseDate}",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 12),
                        Text(
                          movie.synopsis,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 20),

                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () => _selectShowTime(context),
                            icon: Icon(Icons.movie, color: Colors.black),
                            label: Text("Book Now"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
