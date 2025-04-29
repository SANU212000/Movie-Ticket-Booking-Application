// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'package:movie_listing_app/model/movie.dart';
import 'package:movie_listing_app/provider/seat_provider.dart';
import 'package:movie_listing_app/utils/curved_line.dart';

class SeatSelectionScreen extends StatefulWidget {
  final Movie movie;
  final String showTime;

  const SeatSelectionScreen({
    super.key,
    required this.movie,
    required this.showTime,
  });

  @override
  SeatSelectionScreenState createState() => SeatSelectionScreenState();
}

class SeatSelectionScreenState extends State<SeatSelectionScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<SeatProvider>(
        // ignore: use_build_context_synchronously
        context,
        listen: false,
      ).setMovieAndShowTime(widget.movie.title, widget.showTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    final seatProvider = Provider.of<SeatProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  color: Colors.black54,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.movie.posterUrl),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha: 0.7),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.movie.posterUrl,
                          width: 120,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Movie Title",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 2),

                            Text(
                              widget.movie.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              maxLines: 2,
                            ),

                            SizedBox(height: 8),

                            Text(
                              "Show Time",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 2),

                            Text(
                              widget.showTime,
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),
            Text(
              "Select Your Seats",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CurvedLine(),
            ),

            SizedBox(height: 60),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: seatProvider.cols,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.2,
                ),
                itemCount: seatProvider.rows * seatProvider.cols,
                itemBuilder: (context, index) {
                  int row = index ~/ seatProvider.cols;
                  int col = index % seatProvider.cols;
                  String seat = "$row-$col";

                  bool isBooked = seatProvider
                      .getBookedSeats(widget.movie.title, widget.showTime)
                      .contains(seat);
                  bool isSelected = seatProvider.selectedSeats.contains(seat);

                  return GestureDetector(
                    onTap:
                        isBooked ? null : () => seatProvider.toggleSeat(seat),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color:
                            isBooked
                                ? Colors.red[800]
                                : isSelected
                                ? Colors.greenAccent
                                : Colors.grey[800],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        boxShadow:
                            isSelected
                                ? [
                                  BoxShadow(
                                    color: Colors.green,
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                  ),
                                ]
                                : [],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.event_seat,
                              color:
                                  isBooked
                                      ? Colors.white
                                      : isSelected
                                      ? Colors.black
                                      : Colors.white54,
                              size: 24,
                            ),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed:
                    seatProvider.selectedSeats.isEmpty
                        ? null
                        : () {
                          _showCustomConfirmationDialog(context, seatProvider);
                        },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Confirm Booking",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

void _showCustomConfirmationDialog(
  BuildContext context,
  SeatProvider seatProvider,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset("assets/animated icons/tickets.json", width: 150),

              SizedBox(height: 15),

              Text(
                "Confirm Your Booking",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),

              Text(
                "You have selected ${seatProvider.selectedSeats.length} seats.\nDo you want to proceed?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[300]),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      seatProvider.confirmBooking();
                      Navigator.pop(context);
                      Navigator.pop(context);
                      _showSuccessDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15),
              Lottie.asset(
                'assets/animated icons/successTick.json',
                width: 100,
              ),
              Text(
                "Booking Successful!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),

              Text(
                "Your seats have been booked successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[300]),
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "OK",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
