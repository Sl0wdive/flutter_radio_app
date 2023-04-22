import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiko/api/shared_preferences.dart';
import 'package:radiko/models/radio_station.dart';
import 'package:radiko/provider/radio_provider.dart';
import 'package:radiko/utils/radio_stations.dart';
import 'package:radiko/api/radio_api.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _RadioListState();
}

class _RadioListState extends State<Info> {
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
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            provider.station.descr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}