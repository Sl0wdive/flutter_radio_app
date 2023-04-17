import 'package:radiko/models/radio_station.dart';
import 'package:radiko/utils/radio_stations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsApi {
  static const _key = 'radio_station';
  static Future<RadioStation> getInitialRedioStation() async {
    final sharedPrefs = await SharedPreferences.getInstance();
  
    final stationName = sharedPrefs.getString(_key);

    if(stationName == null) return RadioStations.allStations.first;
    return RadioStations.allStations.firstWhere((element) => element.name == stationName);
  }

  static Future<void> setStation(RadioStation station) async {
    final sharedPrefs = await SharedPreferences.getInstance();
  
    sharedPrefs.setString(_key, station.name);
  }
}