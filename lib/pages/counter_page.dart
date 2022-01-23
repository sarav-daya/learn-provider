import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_tutorials/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int myCounter = 0;

  @override
  void initState() {
    super.initState();

    // ? Method 1 (Prefered way of doing)

    // WidgetsBinding.instance!.addPostFrameCallback(
    //   (timeStamp) {
    //     context.read<Counter>().increment();
    //     myCounter = context.read<Counter>().counter + 10;
    //   },
    // );

    // ! Method 2
    // Future.delayed(
    //   Duration(seconds: 0),
    //   () {
    //     context.read<Counter>().increment();
    //     myCounter = context.read<Counter>().counter + 10;
    //   },
    // );

    // ! Method 3
    Future.microtask(() {
      context.read<Counter>().increment();
      myCounter = context.read<Counter>().counter + 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          'counter: ${context.watch<Counter>().counter}\nMyCounter: $myCounter',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: context.read<Counter>().increment,
      ),
    );
  }
}
