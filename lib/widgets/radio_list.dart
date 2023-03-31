import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:radiko/utils/radio_stations.dart';

class RadioList extends StatelessWidget {
  const RadioList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: RadioStations.allStations.length,
      itemBuilder:(context, index) {
        final station = RadioStations.allStations[index];
        return ListTile(
          leading: Image.network(station.photoUrl, width: 50, height: 50, fit: BoxFit.cover,),
          horizontalTitleGap: 40,
          minVerticalPadding: -40,
          title: Text(station.name),
        );
      },
    );
  }
}