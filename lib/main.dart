import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/models/babies.dart';

import 'models/dog.dart';

void main() {
  runApp(const MyApp());
}

// ? From Provider version 4.1
// ? the extension method was introduced in dart version 2.7
// ? It's way to add functionality to existing libraries

// ? context.read<T>() => T
// ? Obtain a value from the nearest ancestor provider of type T
// ! Provider.of<T>(context, listen: false)

// ? context.watch<T>() => T
// ? Obtain a value from the nearest ancestor provider of type T, and subscribe to the provider
// ! Provider.of<T>(context)

// ? context.select<T, R>(R selector(T value)) => R
// ! watch a value of type T exposed from a provider, and listen only partially to changes
// ? This will listen for changes only when the god name changes.
// ! context.select<Dog, String>((Dog dog) => dog.name)

// ! MultiProvider is used to provide more than one proivders.

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Dog>(
          create: (context) => Dog(name: 'dog7', breed: 'breed07', age: 3),
        ),
        FutureProvider<int>(
          create: (context) {
            final dogAge = context.read<Dog>().age;
            final baby = Baby(age: dogAge);
            return baby.getBabies();
          },
          initialData: 0,
        ),
        StreamProvider<String>(
          initialData: 'Cry 0 times',
          create: (context) {
            final dogAge = context.read<Dog>().age;
            final baby = Baby(age: dogAge * 2);
            return baby.cry();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider 07',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
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
        title: const Text('Provider 06'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${context.watch<Dog>().name}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${context.watch<Dog>().breed}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          //'- age: ${Provider.of<Dog>(context).age}',
          '- age: ${context.select<Dog, int>((dog) => dog.age)}',
          style: const TextStyle(fontSize: 20.0),
        ),
        const SizedBox(height: 10.0),
        Text(
          '- number of babies : ${context.watch<int>()}',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10.0),
        Text(
          '- ${context.watch<String>()}',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () => context.read<Dog>().grow(),
          child: const Text(
            'Grow',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ],
    );
  }
}
