import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/models/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider 11',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider 11'),
      ),
      body: Center(
        child: ChangeNotifierProvider<Counter>(
          create: (context) => Counter(),
          child: Builder(
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'counter ${context.watch<Counter>().counter}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                    onPressed: context.read<Counter>().increment,
                    child: Text(
                      'Increment',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
