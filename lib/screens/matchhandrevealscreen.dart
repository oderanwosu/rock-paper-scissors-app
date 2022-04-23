// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpscissors/screens/winOrLoseScreen.dart';

class MatchHandRevealScreen extends StatefulWidget {
  late int playerHand;
  late int opponentHand;
  MatchHandRevealScreen(
      {required int this.playerHand, required int this.opponentHand});

  @override
  State<MatchHandRevealScreen> createState() => _MatchHandRevealScreenState();
}

class _MatchHandRevealScreenState extends State<MatchHandRevealScreen> {
  late Timer _viewTimer;
  double _start = 2;

  @override
  void initState() {
    super.initState();
    _viewTimer = new Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _viewTimer.cancel();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WinOrLoseScreen(
                      opponentHand: widget.opponentHand,
                      playerHand: widget.playerHand,
                    )));
      } else {
        _start--;
      }
    });
  }

  FaIcon iconHand(hand) {
    late FaIcon icon;
    switch (hand) {
      case 1:
        icon = FaIcon(
          FontAwesomeIcons.handBackFist,
          size: 50,
          color: Colors.black,
        );

        break;
      case 2:
        icon = FaIcon(
          FontAwesomeIcons.hand,
          size: 50,
          color: Colors.black,
        );
        break;
      default:
        icon = FaIcon(
          FontAwesomeIcons.handScissors,
          size: 50,
          color: Colors.black,
        );
        break;
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    'You'.toUpperCase(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: iconHand(widget.playerHand))),
                ],
              ),
            ),
            Text('VS'.toUpperCase(),
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 100)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Text(
                    'CPU'.toUpperCase(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: iconHand(widget.opponentHand))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
