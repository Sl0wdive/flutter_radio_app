import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'radio_list.dart';

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
        ),
        Container(
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
        )
      ],
    );
  }
}