import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/movie.dart';
import 'package:movie_listing_app/screens/seat_selection%20_screen.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  void _selectShowTime(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.black,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Select Show Time",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              Container(
                height: 3,
                width: 60,
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              _styledShowTimeTile(
                context,
                "Morning Show",
                "10:00 AM",
                "Morning",
              ),
              _styledShowTimeTile(
                context,
                "Afternoon Show",
                "2:00 PM",
                "Afternoon",
              ),
              _styledShowTimeTile(
                context,
                "Evening Show",
                "6:00 PM",
                "Evening",
              ),
              _styledShowTimeTile(context, " Night Show", "9:00 PM", "Night"),
            ],
          ),
        );
      },
    );
  }

  Widget _styledShowTimeTile(
    BuildContext context,
    String label,
    String time,
    String showTime,
  ) {
    return SingleChildScrollView(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              time,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        onTap: () => _navigateToSeatSelection(context, showTime),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.grey[850],
        hoverColor: Colors.grey[800],
        splashColor: Colors.amber.withOpacity(0.3),
      ),
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
                height: MediaQuery.of(context).size.height * 0.65,
                child: Hero(
                  tag: movie.posterUrl,
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
              maxChildSize: 0.65,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),

                                  SizedBox(height: 4),

                                  Text(
                                    "${movie.releaseDate}  |  ${movie.duration}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 12),
                            _buildUserScoreChart(movie),
                          ],
                        ),

                        Text(
                          movie.genres.join(', '),
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        SizedBox(height: 12),

                        Text(
                          movie.overview,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(height: 16),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// 🎬 **Director**
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Director",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    movie.director,
                                    style: TextStyle(color: Colors.white),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Screenplay",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    movie.screenplay,
                                    style: TextStyle(
                                      color: Colors.white,
                                      height: 1.5,
                                    ),
                                    softWrap: true,
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 20,
              left: 30,
              right: 30,
              child: ElevatedButton.icon(
                onPressed: () => _selectShowTime(context),
                icon: Icon(Icons.movie, color: Colors.black),
                label: Text("Book Now"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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
  }
}

Widget _buildUserScoreChart(dynamic movie) {
  return SizedBox(
    height: 100,
    width: 100,
    child: Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                value: movie.userScore.toDouble(),
                color: Colors.green,
                radius: 12,
                title: '',
              ),
              PieChartSectionData(
                value: (100 - movie.userScore).toDouble(),
                color: Colors.grey[800]!,
                radius: 12,
                title: '',
              ),
            ],
            sectionsSpace: 0,
            centerSpaceRadius: 30,
          ),
        ),

        /// 🎯 **User Score Text**
        Text(
          "${movie.userScore}%",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
