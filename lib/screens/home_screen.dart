import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:radiko/api/radio_api.dart';

import 'package:radiko/widgets/background.dart';
import 'package:radiko/widgets/radio-player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: FutureBuilder(
          future: RadioApi.initPlayer(context),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              );
            }
            return const RadioPlayer();
          }
        ),
      ),
    );
  }
}