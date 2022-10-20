import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintText: 'Email',
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.amber, width: 2.0)
  ),
  errorBorder:  OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 2.0)
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 2.0)
  ),
);

const Map<String, String> errorSignIn = {
  'wrong-password' : 'Contraseña incorrecta.',
  'user-not-found' :  'Este correo no se encuentra registrado.',
  'invalid-email' : 'Este correo tiene un formato incorrecto. Ejemplo: usuario@correo.com'
};