import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiko/api/shared_preferences.dart';
import 'package:radiko/models/radio_station.dart';
import 'package:radiko/provider/radio_provider.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final radioStation = await SharedPrefsApi.getInitialRedioStation();
  runApp(MyApp(
    initialRadioStation: radioStation,
  ));
}

class MyApp extends StatelessWidget {
  final RadioStation initialRadioStation;
  const MyApp({required this.initialRadioStation, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => RadioProvider(initialRadioStation)))
      ],
      child: MaterialApp(
        title: 'Radiko',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}