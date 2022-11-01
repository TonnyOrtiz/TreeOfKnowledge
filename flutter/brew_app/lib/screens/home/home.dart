import 'package:brew_app/models/brew.dart';
import 'package:brew_app/screens/home/brew_list.dart';
import 'package:brew_app/screens/home/settings_form.dart';
import 'package:brew_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_app/services/database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
  
}

class _HomeState extends State<Home> {
  
  final  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    _showSettingsPanel() {
      showModalBottomSheet(
        context: context, 
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: SettingsForm(),
          );
        }
      );
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      initialData: const <Brew>[],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 4.0,
          foregroundColor: Colors.white,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.edit_attributes_sharp, color: Colors.brown[900] ,),
              label: Text('Preferencias',
                style: TextStyle(color: Colors.black, fontSize: 15,),
              ),
              onPressed: () => _showSettingsPanel(),
            ),
            SizedBox(width: 15),
            TextButton.icon(
              icon: Icon(Icons.person, color: Colors.brown[900],), 
              label: Text('Salir',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: BrewList()
          ),
      ),
    ) ;
  }
}