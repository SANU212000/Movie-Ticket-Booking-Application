import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SeatProvider extends ChangeNotifier {
  final int rows = 5;
  final int cols = 8;
  late Box _bookedSeatsBox;
  final Set<String> _selectedSeats = {};
  String _currentMovieId = "";
  String _currentShowTime = "";

  SeatProvider() {
    _bookedSeatsBox = Hive.box('bookedSeatsBox');
  }

  Set<String> get selectedSeats => _selectedSeats;
  String get currentShowTime => _currentShowTime;
  String get currentMovieId => _currentMovieId;

  Set<String> getBookedSeats(String movieId, String showTime) {
    String key = "$movieId-$showTime";
    return (_bookedSeatsBox.get(key, defaultValue: <String>[]) as List<dynamic>)
        .map((seat) => seat.toString())
        .toSet();
  }

  void setMovieAndShowTime(String movieId, String showTime) {
    _currentMovieId = movieId;
    _currentShowTime = showTime;
    _selectedSeats.clear();
    notifyListeners();
  }

  void toggleSeat(String seat) {
    Set<String> bookedSeats = getBookedSeats(_currentMovieId, _currentShowTime);

    if (bookedSeats.contains(seat)) return;

    if (_selectedSeats.contains(seat)) {
      _selectedSeats.remove(seat);
    } else {
      _selectedSeats.add(seat);
    }
    notifyListeners();
  }

  Future<void> confirmBooking() async {
    String key = "$_currentMovieId-$_currentShowTime";
    Set<String> bookedSeats = getBookedSeats(_currentMovieId, _currentShowTime);
    bookedSeats.addAll(_selectedSeats);
    await _bookedSeatsBox.put(key, bookedSeats.toList());
    _selectedSeats.clear();
    notifyListeners();
  }
}
