import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:provider_tutorials/providers/counter.dart';

class HandleDialogPage extends StatefulWidget {
  const HandleDialogPage({Key? key}) : super(key: key);

  @override
  State<HandleDialogPage> createState() => _HandleDialogState();
}

class _HandleDialogState extends State<HandleDialogPage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback(
    //   (timeStamp) {
    //     showDialog(
    //       context: context,
    //       builder: (context) => AlertDialog(
    //         content: Text('Be careful!!'),
    //       ),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback(
    //   (timestamp) {
    //     if (context.read<Counter>().counter == 3) {
    //       showDialog(
    //         context: context,
    //         builder: (context) => AlertDialog(
    //           content: Text('Be careful!!'),
    //         ),
    //       );
    //     }
    //   },
    // );

    Future.delayed(Duration(seconds: 0), () {
      if (context.read<Counter>().counter == 3) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Be careful!!'),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Handle Dialog'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          'counter: ${context.watch<Counter>().counter}',
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
