import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SeatProvider extends ChangeNotifier {
  final int rows = 5;
  final int cols = 8;
  late Box _bookedSeatsBox;
  final Set<String> _selectedSeats = {};
  String _currentMovie = "";
  String _currentShowTime = "";

  SeatProvider() {
    _bookedSeatsBox = Hive.box('bookedSeatsBox');
  }

  Set<String> get selectedSeats => _selectedSeats;
  String get currentShowTime => _currentShowTime;
  String get currentMovie => _currentMovie;

  Set<String> getBookedSeats(String movie, String showTime) {
    String key = "$movie-$showTime";
    return (_bookedSeatsBox.get(key, defaultValue: <String>[]) as List<dynamic>)
        .map((seat) => seat.toString())
        .toSet();
  }

  void setMovieAndShowTime(String movie, String showTime) {
    _currentMovie = movie;
    _currentShowTime = showTime;
    _selectedSeats.clear();
    notifyListeners();
  }

  void toggleSeat(String seat) {
    Set<String> bookedSeats = getBookedSeats(_currentMovie, _currentShowTime);

    if (bookedSeats.contains(seat)) return;

    if (_selectedSeats.contains(seat)) {
      _selectedSeats.remove(seat);
    } else {
      _selectedSeats.add(seat);
    }
    notifyListeners();
  }

  Future<void> confirmBooking() async {
    String key = "$_currentMovie-$_currentShowTime";
    Set<String> bookedSeats = getBookedSeats(_currentMovie, _currentShowTime);
    bookedSeats.addAll(_selectedSeats);
    _bookedSeatsBox.put(key, bookedSeats.toList());
    _selectedSeats.clear();
    notifyListeners();
  }
}
