import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_tutorials/providers/counter.dart';

class HandleDialogPage extends StatefulWidget {
  const HandleDialogPage({Key? key}) : super(key: key);

  @override
  State<HandleDialogPage> createState() => _HandleDialogState();
}

class _HandleDialogState extends State<HandleDialogPage> {
  int myCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
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

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          'Other',
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }
}
