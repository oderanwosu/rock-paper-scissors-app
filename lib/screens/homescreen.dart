// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpscissors/screens/matchhandselectionscreen.dart';
import 'package:rpscissors/screens/opponentselectionscreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('lets play...'),
          Row(
            children: const [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: const FaIcon(
                    FontAwesomeIcons.handBackFist,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: const FaIcon(
                    FontAwesomeIcons.hand,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: const FaIcon(
                    FontAwesomeIcons.handScissors,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Text('rock paper scissors'.toUpperCase(),
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30)),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OpponentSelectionScreen()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(140, 20, 140, 20),
                    child: Text('start', style: TextStyle(color: Colors.black)),
                  )))
        ]),
      ),
    );
  }
}
