import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'store/models.dart';

void main() {
  runApp(new CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CounterHome('Scoped Model Demo'),
      ),
    );
  }
}

class CounterHome extends StatelessWidget {
  final String title;

  CounterHome(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildCounterText(),
            buildCounterButtons(),
          ],
        ),
      ),
      floatingActionButton: buildIncrementFab(),
    );
  }
}

var counterText = (int counter) =>
    "You have incremented the counter ${counter.toString()} times";

var buildCounterText = () => ScopedModelDescendant<MainModel>(
      builder: (context, child, model) => Text(
            counterText(model.counter),
            style: Theme.of(context).textTheme.body2,
          ),
    );

var buildIncrementFab = () => ScopedModelDescendant<MainModel>(
      builder: (context, child, model) => FloatingActionButton(
            onPressed: model.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
    );

var buildCounterButtons = () => ScopedModelDescendant<MainModel>(
    builder: (context, child, model) => ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: model.decrement,
              child: Text('Decrement'),
            ),
            RaisedButton(
              onPressed: model.reset,
              child: Text('Reset'),
            ),
          ],
        ));
