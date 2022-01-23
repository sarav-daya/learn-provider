import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_tutorials/providers/counter.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({Key? key}) : super(key: key);

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  int myCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigate'),
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
