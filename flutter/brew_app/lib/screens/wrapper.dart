import 'package:brew_app/models/brewuser.dart';
import 'package:brew_app/screens/authenticate/authenticate.dart';
import 'package:brew_app/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final BrewUser? user = Provider.of<BrewUser?>(context);

    //print(user);
    // Return either Authenticate or Home widget
    if (user == null) {
      return Authenticate();
    } else {
      //return Authenticate();
      return Home();
    }
    
  }
}