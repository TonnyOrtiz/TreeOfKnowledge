import 'package:brew_app/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:brew_app/services/auth.dart';
import 'package:brew_app/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
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
        title: const Text('Registrarse'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            }, 
            icon: Icon(Icons.person, color: Colors.black,), 
            label: const Text(
              'Iniciar Sesión',
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
              const SizedBox(height: 20.0,),
              TextFormField(
                initialValue: email,
                decoration: textInputDecoration.copyWith(hintText: 'Correo'),
                validator: (value) => (value as String).isEmpty ? 'Ingrese un correo válido' : null,/**Null: es valido */
                onChanged: (value) {
                  setState(() => email = value.trim());
                },
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                initialValue: password,
                decoration: textInputDecoration.copyWith(hintText: 'Contraseña'),
                validator: (value) => (value as String).length < 6 ? 'Ingrese una contraseña de al menos 6 caracteres de largo' : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              const SizedBox(height: 40.0,),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                ),
                child: const Text(
                  'Registrarse',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password,);
                    if (result == null) {
                      setState(() {
                        error = 'Porfavor ingrese un correo válido';
                        loading = false;
                      });
                    }
                  }
                },
              ),
              const SizedBox(height: 12.0,),
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