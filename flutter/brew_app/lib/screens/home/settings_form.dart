import 'package:brew_app/models/brewuser.dart';
import 'package:brew_app/services/database.dart';
import 'package:brew_app/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_app/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // Form Values

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;
  
  @override
  Widget build(BuildContext context) {
    final BrewUser? user = Provider.of<BrewUser?>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user!.uid).userData,
      builder: (context, snapshot) {

        if (snapshot.data !=null) {
          UserData userData = snapshot.data!;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const Text(
                  'Edite sus preferencias de Café',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 20.0,),
                TextFormField(
                  enableInteractiveSelection: true,
                  initialValue: userData.name,
                  decoration: textInputDecoration.copyWith(hintText: 'Nombre'),
                  validator: (value) => value!=null && value.isEmpty ?  'Porfavor ingrese un nombre.' : null,
                  onChanged: (value) => setState(() => _currentName = value) ,
                ),
                const SizedBox(height: 20.0,),
                // dropdown
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: userData.sugars,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: sugar == '1' ? Text('$sugar cucharada de azúcar') : Text('$sugar cucharadas de azúcar')
                      );
                  }).toList(), 
                  onChanged: (value) => setState(() => _currentSugars = value as String),
                  ),
                  const SizedBox(height: 20,),
                /**
                 * Slider
                 */
                Slider(
                  activeColor: Colors.brown[_currentStrength ?? userData.strength],
                  inactiveColor: Colors.brown[_currentStrength ?? userData.strength],
                  min: 100,
                  max: 900,
                  divisions: 8,
                  value: (_currentStrength ?? userData.strength).toDouble(), 
                  onChanged: (value) => setState(() => _currentStrength = value.round()),
                ),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink)),
                  child: const Text(
                    'Aplicar cambios',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState!.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentSugars ?? userData.sugars, 
                        _currentName ?? userData.name, 
                        _currentStrength ?? userData.strength
                      );
                      Navigator.pop(context);  
                    }
                    
                  }, 
                  ),
              ],
            )
          );
        } else {
          return const Loading();
        }
      }
    );   
  }
}