import 'package:flutter/material.dart';
import 'package:snake/responsive/horizontal_layout.dart';
import 'package:snake/responsive/vertical_layout.dart';
import 'package:snake/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //final currentWidth = MediaQuery.of(context).size.width;
    //final currentHeight = MediaQuery.of(context).size.height;
    return ResponsiveLayout(
        mobileBody: const VerticalLayout(), desktopBody: const HorizontalLayout());
  }
}
