import 'package:flutter/material.dart';
import 'package:brew_app/services/auth.dart';
class Register extends StatefulWidget {

  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign Up to Brew Crew'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person, color: Colors.black,), 
            label: Text(
              'Sign In',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (value) => (value as String).isEmpty ? 'Enter an email' : null,/**Null: es valido */
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (value) => (value as String).length < 6 ? 'Enter a password with at least 6 characters long' : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              SizedBox(height: 40.0,),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password,);
                    if (result == null) {
                      setState(() => error = 'Please supply a valid email');
                    }
                  }
                },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}