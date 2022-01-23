import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/app_provider.dart';
import 'package:provider_tutorials/success_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: MaterialApp(
        title: 'addListener of ChangeNotifier',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? searchTerm;

  void submit() async {
    setState(() {
      autovalidateMode = AutovalidateMode.always;
    });

    final form = formKey.currentState;
    if (form == null || !form.validate()) return;

    form.save();

    context.read<AppProvider>().getResult(context, searchTerm!);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => SuccessPage(),
    //   ),
    // );

    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     content: Text('Something went wrong.'),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppProvider>().state;
    // if (appState == AppState.success) {
    //   WidgetsBinding.instance!.addPostFrameCallback(
    //     (timeStamp) {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => SuccessPage(),
    //         ),
    //       );
    //     },
    //   );
    // } else if (appState == AppState.error) {
    //   WidgetsBinding.instance!.addPostFrameCallback(
    //     (timeStamp) {
    //       showDialog(
    //         context: context,
    //         builder: (context) => AlertDialog(
    //           content: Text('Something went wrong.'),
    //         ),
    //       );
    //     },
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: ListView(
                shrinkWrap: true,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Search'),
                      prefixIcon: Icon(Icons.search),
                    ),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Search term required';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      searchTerm = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  appState == AppState.loading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed:
                              appState == AppState.loading ? null : submit,
                          child: Text(
                            appState == AppState.loading
                                ? 'Loading'
                                : 'Get Result',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
