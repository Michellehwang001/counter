import 'package:flutter/material.dart';
import 'package:flutter_counter/bloc/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

// 가장 쉽게 최상위에 변수 선언
final counterBloc = CounterBloc();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<int>(
                stream: counterBloc.count$,
                builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Text('${snapshot.data}', style: TextStyle(fontSize: 50),);
                  }
                  return CircularProgressIndicator();
                }
              ),
              ElevatedButton(onPressed: () {
                counterBloc.addCounter();
              }, child: Text('ADD')),
            ],
          ),
        ),
    );
  }
}

