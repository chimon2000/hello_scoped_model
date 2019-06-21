import 'package:scoped_model/scoped_model.dart';

mixin CounterModel on Model {
  var _counter = 0;

  int get counter => _counter;
}

mixin IncrementModel on CounterModel {
  void increment() {
    // First, increment the counter
    _counter++;

    // Then notify all the listeners.
    notifyListeners();
  }
}

mixin DecrementModel on CounterModel {
  void decrement() {
    // First, decrement the counter
    _counter--;

    // Then notify all the listeners.
    notifyListeners();
  }
}

mixin ResetModel on CounterModel {
  void reset() {
    // First, reset the counter
    _counter = 0;

    // Then notify all the listeners.
    notifyListeners();
  }
}

class MainModel extends Model
    with CounterModel, IncrementModel, DecrementModel, ResetModel {}
