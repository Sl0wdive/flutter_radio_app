import 'package:radiko/models/radio_station.dart';

class RadioStations {
  static List<RadioStation> allStations = [
    RadioStation(
      name: 'Jazz',
      streamUrl: 'http://mediaserv38.live-streams.nl:8006/live',
      photoUrl: 'https://www.hionline.eu/wp-content/uploads/2016/06/Reel-to-Reel-Gif.gif'
    ),
    RadioStation(
      name: 'Classical',
      streamUrl: 'http://mediaserv30.live-streams.nl:8088/live',
      photoUrl: 'https://img.apmcdn.org/c75e4ad850e43237fe0568a59ab71b15cb2511ac/uncropped/b80d45-20120627-flute-concert.jpg'
    ),
  ];
}