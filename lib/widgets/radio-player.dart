import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radiko/api/radio_api.dart';
import 'package:radiko/provider/radio_provider.dart';
import 'package:volume_controller/volume_controller.dart';

import 'radio_list.dart';

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({super.key});

  @override
  State<RadioPlayer> createState() => _RadioPlayer();
}

class _RadioPlayer extends State<RadioPlayer> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> radioOffset;
  late Animation<Offset> radioListOffset;
  late VolumeController volumeController;

  bool listEnabled = false;
  bool isPlaying = true;
  bool isMuted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    
    radioListOffset = Tween(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));
  
    radioOffset = Tween(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));
  
    RadioApi.player.stateStream.listen((event) {
      setState(() {
        isPlaying = event;
      });
    });
    volumeController = VolumeController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SlideTransition(
            position: radioOffset,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200, 
                  width: 200, 
                  color: Colors.transparent,
                  child: Consumer<RadioProvider>(builder: ((context, value, child) {
                    return Image.network(
                      value.station.photoUrl, 
                      fit: BoxFit.cover,
                    );
                  })),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          listEnabled = !listEnabled;
                        });
                        switch (animationController.status) {
                          case AnimationStatus.dismissed:
                            animationController.forward();
                            break;
                          case AnimationStatus.completed:
                            animationController.reverse();
                            break;
                        }
                      },
                      color: listEnabled ? Colors.deepPurple : Colors.white,
                      iconSize: 30,
                      icon: Icon(
                        Icons.list
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        isPlaying ? RadioApi.player.stop() : RadioApi.player.play();
                      },
                      color: Colors.white,
                      iconSize: 30,
                      icon: Icon(
                        isPlaying ? Icons.stop : Icons.play_arrow 
                      ),
                    ),
                    IconButton(
                      onPressed: () async{
                        if(isMuted) {
                          volumeController.setVolume(0.5);
                        } else {
                          volumeController.muteVolume();
                        }
                        setState(() {
                          isMuted = !isMuted;
                        });
                      },
                      color: Colors.white,
                      iconSize: 30,
                      icon: Icon(
                        isMuted ? Icons.volume_mute : Icons.volume_up
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ),
        SlideTransition(
          position: radioListOffset,
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  30
                )),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Radio list',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                const Divider(
                  color: Colors.black,
                  indent: 30,
                  endIndent: 30,
                ),
                Expanded(child: RadioList()),
              ],
              )
          ),
        )
      ],
    );
  }
}