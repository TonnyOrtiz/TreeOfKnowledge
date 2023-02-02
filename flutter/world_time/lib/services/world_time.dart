import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WorldTime {
  String location; // Location name for the UI
  String time = ''; // Time in that location
  String flag; // Url to an asset image
  String url; // location url for api endpoint
  bool isDaytime = true; // true or false if is daytime or not

  WorldTime(
      {this.location = 'Costa Rica',
      this.flag = '',
      this.url = 'America/Costa_Rica'});

  Future<void> getTime() async {
    try {
      print('parada 1\n');
      Response response;
      // Make the request
      if (kIsWeb) {
        response = await get(Uri.parse(
            'https://cors-anywhere.herokuapp.com/https://www.timeapi.io/api/Time/current/zone?timeZone=$url'));
      } else {
        response = await get(Uri.parse(
            'https://www.timeapi.io/api/Time/current/zone?timeZone=$url'));
      }
      Map data = jsonDecode(response.body);
      print(data);
      time = data['dateTime'];
      DateTime now = DateTime.parse(time);
      // Set the time property
      isDaytime = now.hour > 4 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      //print('Error: $e');
      time = 'Error';
    }
  }
}
