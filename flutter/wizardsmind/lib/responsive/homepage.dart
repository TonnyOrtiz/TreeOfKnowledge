import 'package:flutter/material.dart';
import 'package:wizardsmind/responsive/desktop_body.dart';
import 'package:wizardsmind/responsive/mobile_body.dart';
import 'package:wizardsmind/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;
    return ResponsiveLayout(
        mobileBody: const MyMobileBody(), desktopBody: const MyDesktopBody());
  }
}
