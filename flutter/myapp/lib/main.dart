import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: HomeScreen()
));

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int visitedIslands = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[800],
        elevation: 8.0,
        title: Text(
          'INSIGNIA DE PIRATA',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.0,
            fontWeight: FontWeight.bold,
            fontSize: 20.0 ,
          ),),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/roger1.jpg'),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 50,
              color: Colors.grey[600],
            ),
            Text(
              'NOMBRE',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Gol D. Roger',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.yellow[700],
              )
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'SOBRENOMBRE',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
                'Rey de los Piratas',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700],
                )
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'TRIPULACION',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
                'Los Piratas de Roger',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700],
                )
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'EMBARCACION',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
                'Oro Jackson',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700],
                )
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              'CANTIDA DE ISLAS VISITADAS',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
                '$visitedIslands',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[700],
                )
            ),
            const SizedBox(
              height: 30.0,
            ),
          ]

        ),
      ),
      backgroundColor: Colors.grey[900],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            visitedIslands++;
          });
        },
        child: Icon(Icons.anchor),
        backgroundColor: Colors.red[900],
      ),
    );
  }
}