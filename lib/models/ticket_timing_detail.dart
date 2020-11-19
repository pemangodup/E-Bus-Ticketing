
class TicketTimingDetail{
  int  _departureTime;
  int _arrivalTime;
  String _busName;
  String _busType;
  double _ticketPrice;

  int get departureTime => _departureTime;

  set departureTime(int value) {
    _departureTime = value;
  }

  int get arrivalTime => _arrivalTime;

  double get ticketPrice => _ticketPrice;

  set ticketPrice(double value) {
    _ticketPrice = value;
  }

  String get busType => _busType;

  set busType(String value) {
    _busType = value;
  }

  String get busName => _busName;

  set busName(String value) {
    _busName = value;
  }

  set arrivalTime(int value) {
    _arrivalTime = value;
  }
}