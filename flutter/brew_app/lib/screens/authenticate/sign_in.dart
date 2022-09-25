import 'package:brew_app/models/brewuser.dart';
import 'package:brew_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In to Brew Crew'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: Text('Sign in Anon'),
          onPressed: (() async {
            dynamic result = await _auth.signInAnon();
            if (result == null) {
              print('Error signin in');
            } else {
              BrewUser user = result as BrewUser;
              print('Sign in');
              print(user.uid);
            }
          }),
          ),
      ),
    );
  }
}