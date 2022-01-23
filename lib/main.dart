import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/pages/counter_page.dart';
import 'package:provider_tutorials/pages/handle_dialog_page.dart';
import 'package:provider_tutorials/pages/navigate_page.dart';
import 'package:provider_tutorials/providers/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
      child: MaterialApp(
        title: 'addPostFrameCallback',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('addPostFrameCallback'),
        elevation: 0.0,
      ),
      body: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              shrinkWrap: true,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CounterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Counter Page',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HandleDialogPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Handle Dialog Page',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigatePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Navigate Page',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
