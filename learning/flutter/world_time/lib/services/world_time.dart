import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // Location name for the UI
  String time=''; // Time in that location
  String flag; // Url to an asset image
  String url;  // location url for api endpoint
  bool isDaytime=true; // true or false if is daytime or not

  WorldTime({this.location = 'Costa Rica', this.flag = '', this.url='America/Costa_Rica'});

  Future<void> getTime() async {

    try {
      // Make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(datetime);
      now = now.subtract(Duration(hours: int.parse(offset)));
      // Set the time property
      isDaytime = now.hour > 4 && now.hour < 19 ? true : false;
      //isDaytime = true;
      time = DateFormat.jm().format(now);

    } catch(e) {
      print('Error: $e');
      time = 'Error';
    }

  }
}