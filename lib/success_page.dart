import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          'Success',
          style: TextStyle(fontSize: 48.0, color: Colors.green),
        ),
      ),
    );
  }
}
