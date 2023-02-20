import 'package:isolator/isolator.dart';
import 'package:flutter/material.dart';
import 'package:snake/controller/first_backend.dart';

enum Events { increment, decrement, setCounter, printFrame, test }

class FirstFrontend with ChangeNotifier, Frontend {
  int _counter = 0;

  int get counter {
    return _counter;
  }

  Future<void> initState() async {
    await initBackend(initializer: _launch);
  }

  Future<void> launch() async {}

  static FirstBackend _launch(BackendArgument<void> argument) {
    return FirstBackend(argument);
  }

  Future<void> increment([int diff = 1]) async {
    _counter = (await run(event: Events.increment, data: diff)) as int;
  }

  Future<void> decrement([int diff = 1]) async {
    _counter = (await run(event: Events.decrement, data: diff)) as int;
  }

  Future<void> test() async {
    run(event: Events.test, data: 0);
  }

  void _setCounter(int value) {
    _counter = value;
    print('_setCounter ... $counter');
    notifyListeners();
  }

  void _printFrame(int foo) {
    _counter = foo;
    print('Frame $foo');
    //notifyListeners();
  }

  @override
  void initActions() {
    //whenEventCome(Events.increment).run(({data, 1}) => null);
    whenEventCome(Events.setCounter)
        .runSimple((data) => _setCounter(data as int));
    whenEventCome(Events.printFrame)
        .runSimple((data) => _printFrame(data as int));
  }
}
