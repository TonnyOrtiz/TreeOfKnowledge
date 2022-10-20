import 'package:flutter/material.dart';
import 'package:brew_app/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // Form Values

  String _currentName = '';
  String _currentSugars= '';
  int _currentStrength = 0;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Text(
            'Edite sus preferencias de Café',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: 'Nombre'),
            validator: (value) => value!=null && value.isEmpty ?  'Porfavor ingrese un nombre.' : null,
            onChanged: (value) => setState(() => _currentName = value) ,
          ),
        ],
      )
      );   
  }
}