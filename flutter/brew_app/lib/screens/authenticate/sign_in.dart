import 'package:brew_app/models/brewuser.dart';
import 'package:brew_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_app/shared/constants.dart';
import 'package:brew_app/shared/loading.dart';

class SignIn extends StatefulWidget {
  
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? const Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Ingresar'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person, color: Colors.black,), 
            label: Text(
              'Registrarse',
              style: TextStyle(
                color: Colors.black,
              ),
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
                initialValue: email,
                decoration: textInputDecoration.copyWith(hintText: 'Correo'),
                validator: (value) => (value as String).isEmpty ? 'Ingrese un correo válido': null,
                onChanged: (value) {
                  setState(() => email = value.trim());
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                initialValue: password,
                decoration: textInputDecoration.copyWith(hintText: 'Contraseña'),
                validator: (value) => (value as String).length < 6 ? 'Ingrese una contraseña con al menos 6 caracteres de largo' : null,
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
                  'Iniciar sesión',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password,);
                    if (result.runtimeType == String) {
                      setState(() {
                        error = errorSignIn[result]!;
                        loading=false;
                      });
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