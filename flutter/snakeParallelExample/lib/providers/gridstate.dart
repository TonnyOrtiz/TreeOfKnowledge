import 'package:flutter/material.dart';

class GridState with ChangeNotifier{
  List<int> _frame = [];

  List<int> get frame {
    return _frame;
  }

  set frame (List<int> newFrame) {
    _frame = newFrame;
    notifyListeners();
  }
}
