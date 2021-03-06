import 'package:flutter/material.dart';
import 'package:provider_tutorials/success_page.dart';

enum AppState {
  initial,
  loading,
  success,
  error,
}

class AppProvider with ChangeNotifier {
  AppState _state = AppState.initial;
  AppState get state => _state;
  //Future<void> getResult(BuildContext context, String searchTerm) async
  Future<void> getResult(String searchTerm) async {
    _state = AppState.loading;
    notifyListeners();

    await Future.delayed(Duration(seconds: 1));

    try {
      if (searchTerm == 'fail') {
        throw Exception('Something went wrong');
      }

      _state = AppState.success;
      notifyListeners();

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => SuccessPage(),
      //   ),
      // );
    } catch (e) {
      _state = AppState.error;
      notifyListeners();

      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       content: Text('Something went wrong'),
      //     );
      //   },
      // );
    }
  }
}
