import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
//  final Function start;
  const PlayButton({super.key //required this.start
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
            color: Colors.purple[400],
            onPressed: () {},
            child: const Text('JUGAR')),
      ),
    );
  }
}
