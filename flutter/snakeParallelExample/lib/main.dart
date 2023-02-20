import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snake/controller/first_frontend.dart';
import 'package:snake/providers/gridstate.dart';

import 'package:snake/responsive/homepage.dart';

void main() async {
  FirstFrontend frontend = FirstFrontend();
  await frontend.initState();
  runApp(MyApp(front: frontend));
}

class MyApp extends StatelessWidget {
  final FirstFrontend front;
  const MyApp({super.key, required this.front});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => front,
        ),
      ],
      child: MaterialApp(
        title: 'Snake',
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
