import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'Londres, UK', flag: 'unitedk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin, Alemania', flag: 'alemania.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires, Argentina', flag: 'argentina.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney, Australia', flag: 'australia.png'),
    WorldTime(url: 'America/Costa_Rica', location: 'San Jose, Costa Rica', flag: 'costarica.png'),
    WorldTime(url: 'America/Jamaica', location: 'Kingston, Jamaica', flag: 'jamaica.png'),
    WorldTime(url: 'Europe/London', location: 'Londres, UK', flag: 'unitedk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin, Alemania', flag: 'alemania.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos Aires, Argentina', flag: 'argentina.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney, Australia', flag: 'australia.png'),
    WorldTime(url: 'America/Costa_Rica', location: 'San Jose, Costa Rica', flag: 'costarica.png'),
    WorldTime(url: 'America/Jamaica', location: 'Kingston, Jamaica', flag: 'jamaica.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to homescreen and pass the data
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0, 
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 1.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
