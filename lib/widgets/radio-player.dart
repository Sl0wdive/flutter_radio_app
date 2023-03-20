import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({super.key});

  @override
  State<RadioPlayer> createState() => _RadioPlayer();
}

class _RadioPlayer extends State<RadioPlayer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200, 
                width: 200, 
                color: Colors.pink,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    iconSize: 30,
                    icon: Icon(
                      Icons.list
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    iconSize: 30,
                    icon: Icon(
                      Icons.play_arrow
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    iconSize: 30,
                    icon: Icon(
                      Icons.volume_up
                    ),
                  ),
                ],
              )
            ],
          )
        )
      ],
    );
  }
}