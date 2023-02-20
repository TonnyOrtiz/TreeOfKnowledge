import 'package:flutter/material.dart';
import 'package:snake/view/gamegrid.dart';
import 'package:snake/view/play_button.dart';

class HorizontalLayout extends StatelessWidget {
  const HorizontalLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        children: [
          // Highscores
          Expanded(child: Container()),
          // Grid
          const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(alignment: Alignment.center, child: GameGrid()),
              )),
          // Play Button
          const Expanded(
            flex: 1,
            child: PlayButton(),
          ),
        ],
      ),
    );
  }
}
