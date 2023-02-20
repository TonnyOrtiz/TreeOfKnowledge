import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake/controller/first_frontend.dart';
import 'package:snake/view/blank_pixel.dart';
import 'package:snake/view/snake_pixel.dart';
import 'package:snake/view/food_pixel.dart';
import 'package:tuple/tuple.dart';

enum FieldState {
  blank(1),
  snake(2),
  food(3);

  const FieldState(this.value);
  final int value;
}

class GameGrid extends StatelessWidget {
  const GameGrid({super.key});
  //grid dimensions
  //int rowSize = 10;

  //int totalNumerOfSquares = 100;
  @override
  Widget build(BuildContext context) {
    final firstfrontend = Provider.of<FirstFrontend>(context);
    //firstfrontend.initState();
    firstfrontend.test();
    //print('object');

    return AspectRatio(
      aspectRatio: 1,
      child: SizedBox(height: 10),
      /*child: GridView.builder(
            itemCount: gridState.length - 1,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridState.last,
            ),
            itemBuilder: (context, index) {
              //switch (gridState.elementAt(index)) {

              //break;

              //}
              /*if (gridState.elementAt(index)==) {
            return const SnakePixel();
          } else if (index == foodPos) {
            return const FoodPixel();
          }
          else {
            return const BlankPixel();  
          }*/
            })*/
    );
  }
}
