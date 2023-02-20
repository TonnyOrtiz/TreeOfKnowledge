import 'package:isolator/isolator.dart';
import 'package:snake/controller/first_frontend.dart';
//Snake Position
import 'dart:async';

class FirstBackend extends Backend {
  FirstBackend(BackendArgument<void> argument) : super(argument: argument);

  int counter = 0;

  void _test(int data) {
    counter = data;
    Timer.periodic(Duration(milliseconds: 400), (timer) {
      counter++;
      //print('. . .');
      send(event: Events.printFrame, data: counter);
      if (counter == 10) {
        timer.cancel();
      }
    });
  }

  void _increment(int diff) {
    counter += diff;
    print('_increment ... $counter');
    /*List<int> snakePos = [
      0,
      1,
      2,
    ];*/

//food position
    int foodPos = 0;
    Timer.periodic(Duration(seconds: 2), (timer) {
      //setState(() {
      foodPos++;
      send(event: Events.printFrame, data: foodPos);

      // Add a new head,
      //snakePos.add(snakePos.last+1);
      //remove the tail
      //snakePos.removeAt(0);
      //});
    });

    //send(event: Events.setCounter, data: counter);
  }

  void _decrement(int diff) {
    counter -= diff;
    print('_decrement ... $counter');
    send(event: Events.setCounter, data: counter);
  }

  @override
  void initActions() {
    whenEventCome(Events.increment)
        .runSimple((data) => _increment(data as int));
    whenEventCome(Events.decrement)
        .runSimple((data) => _decrement(data as int));
    whenEventCome(Events.test).runSimple((data) => _test(data as int));
  }
}
