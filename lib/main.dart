import 'package:bloclibrarytutorial/counter_bloc.dart';
import 'package:bloclibrarytutorial/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _counterBloc,
      child: const CounterWidget(),
    );
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: BlocProvider.of<CounterBloc>(context),
        builder: (context, CounterState state) {
          return Center(
            child: Column(
              children: [
                const Text('You have pushed the button this number of times: '),
                Text('${state.counter}'),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).onIncrement(),
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).onDecrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
