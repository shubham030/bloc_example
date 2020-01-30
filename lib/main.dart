import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/screen/screen1.dart';
import 'package:counter/utils/bloc_provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterBloc _counterBloc = CounterBloc();

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: BlocProvider(
        bloc: _counterBloc,
        child: Screen1(),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          Spacer(),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.decrementCounter();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              _counterBloc.incrementCounter();
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
