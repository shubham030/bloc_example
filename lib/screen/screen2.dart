import 'package:counter/bloc/counter_bloc.dart';
import 'package:counter/utils/bloc_provider.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  CounterBloc _counterBloc;

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _counterBloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _counterBloc.counter,
      builder: (context, snapshot) {
        return Center(
          child: Text(
            '${snapshot.data}',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        );
      },
    );
  }
}
