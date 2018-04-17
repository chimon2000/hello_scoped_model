import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  var _counter = 0;

  int get counter => _counter;
}

abstract class IncrementModel extends CounterModel {
  void increment() {
    // First, increment the counter
    _counter++;

    // Then notify all the listeners.
    notifyListeners();
  }
}

abstract class DecrementModel extends CounterModel {
  void decrement() {
    // First, decrement the counter
    _counter--;

    // Then notify all the listeners.
    notifyListeners();
  }
}

abstract class ResetModel extends CounterModel {
  void reset() {
    // First, reset the counter
    _counter = 0;

    // Then notify all the listeners.
    notifyListeners();
  }
}

class MainModel extends Model
    with CounterModel, IncrementModel, DecrementModel, ResetModel {}
