import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:radiko/api/shared_preferences.dart';
import 'package:radiko/models/radio_station.dart';
import 'package:radiko/provider/radio_provider.dart';
import 'package:radiko/utils/radio_stations.dart';

class RadioList extends StatefulWidget {
  const RadioList({super.key});

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  late RadioStation selectedStation;
  late RadioProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<RadioProvider>(context, listen: false);
    selectedStation = provider.station;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RadioProvider>(context, listen: false);
    return ListView.builder(
      itemCount: RadioStations.allStations.length,
      itemBuilder:(context, index) {
        final station = RadioStations.allStations[index];
        bool isSelected = station.name == provider.station.name;
        return Container(
          decoration: BoxDecoration(
            gradient: isSelected ? 
            const LinearGradient(colors: [Colors.black, Colors.deepPurple]) : null
          ),
          child: ListTile(
            leading: Image.network(station.photoUrl, width: 50, height: 50, fit: BoxFit.cover,),
            horizontalTitleGap: 40,
            title: Text(
              station.name,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            onTap: () {
              provider.setRadioStation(station);
              SharedPrefsApi.setStation(station);
              setState(() {
                selectedStation = station;
              });
              },
          ),
        );
      },
    );
  }
}