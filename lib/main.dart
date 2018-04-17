import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'store/models.dart';

void main() {
  runApp(new CounterApp());
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ScopedModel<MainModel>(
      model: new MainModel(),
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new CounterHome('Scoped Model Demo'),
      ),
    );
  }
}

class CounterHome extends StatelessWidget {
  final String title;

  CounterHome(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
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

var buildCounterText = () => new ScopedModelDescendant<MainModel>(
      builder: (context, child, model) => new Text(
          "You have incremented the counter the button ${model.counter.toString()} times",
          style: Theme.of(context).textTheme.body2),
    );

var buildIncrementFab = () => new ScopedModelDescendant<MainModel>(
      builder: (context, child, model) => new FloatingActionButton(
            onPressed: model.increment,
            tooltip: 'Increment',
            child: new Icon(Icons.add),
          ),
    );

var buildCounterButtons = () => new ScopedModelDescendant<MainModel>(
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
