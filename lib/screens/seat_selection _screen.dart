import 'package:flutter/material.dart';
import 'package:movie_listing_app/model/movie.dart';
import 'package:movie_listing_app/provider/seat_provider.dart';
import 'package:movie_listing_app/utils/benled_screen.dart';
import 'package:provider/provider.dart';

class SeatSelectionScreen extends StatefulWidget {
  final Movie movie;
  final String showTime;

  const SeatSelectionScreen({
    Key? key,
    required this.movie,
    required this.showTime,
  }) : super(key: key);

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<SeatProvider>(
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
            Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movie.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                SizedBox(height: 4),

                Text(
                  widget.showTime,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
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
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CurvedLine(),
            ),

            SizedBox(height: 20),

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
                        ), // Adjust curvature
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
                child: Text(
                  "Confirm Booking",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
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
              /// 🎟️ Booking Icon
              Icon(Icons.confirmation_number, size: 60, color: Colors.amber),
              SizedBox(height: 15),

              /// 📢 Confirmation Text
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
              Icon(Icons.check_circle, size: 60, color: Colors.greenAccent),
              SizedBox(height: 15),

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
