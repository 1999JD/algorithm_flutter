import 'package:flutter/cupertino.dart';

class Test with ChangeNotifier {
  final List<int> _bookSectionList = [1, 2, 3];

  void printBooks() {
    for (var i = 0; i < 3; i++) {
      print(_bookSectionList[i]);
    }
  }
}
