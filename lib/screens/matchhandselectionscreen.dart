// ignore_for_file: file_names

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpscissors/screens/matchhandrevealscreen.dart';
import 'package:rpscissors/screens/winOrLoseScreen.dart';

class MatchHandSelectionScreen extends StatefulWidget {
  MatchHandSelectionScreen({Key? key}) : super(key: key);

  @override
  State<MatchHandSelectionScreen> createState() =>
      _MatchHandSelectionScreenState();
}

class _MatchHandSelectionScreenState extends State<MatchHandSelectionScreen> {
  Color _bgColor = Colors.black;
  Color _primaryColor = Colors.white;
  int _selectedHand = 1;
  int _start = 1;
  late Timer _timer;
  late Timer _selectionTimer;
  int _startSelection = 5;

  @override
  void initState() {
    super.initState();
    const oneSec = const Duration(seconds: 1);
    _selectionTimer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_startSelection == 0) {
          _selectionTimer.cancel();
          selectScreen((Random().nextInt(2) + 1), context);
        } else {
          setState(() {
            _startSelection--;
          });
        }
      },
    );
  }

  void selectScreen(index, context) {
    setState(() {
      _selectionTimer.cancel();
      _bgColor = Colors.white;
      _primaryColor = Colors.black;
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) {
          if (_start == 0) {
            _timer.cancel();
            int cpuHand = (Random().nextInt(2) + 1);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MatchHandRevealScreen(
                      opponentHand: cpuHand, playerHand: index)),
            );
          } else {
            setState(() {
              _start--;
            });
          }
        },
      );
      _selectedHand = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CircleAvatar(
                backgroundColor: _primaryColor,
                child: Text('$_startSelection\s')),
          ),
          const Text(
            'rock paper or scissors?',
          ),
          Center(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    selectScreen(1, context);
                  },
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: _primaryColor,
                    child: FaIcon(
                      FontAwesomeIcons.handBackFist,
                      size: 50,
                      color: _bgColor,
                    ),
                  ),
                )),
          ),
          Padding(
              padding: EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  selectScreen(2, context);
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: _primaryColor,
                  child: FaIcon(
                    FontAwesomeIcons.hand,
                    size: 50,
                    color: _bgColor,
                  ),
                ),
              )),
          Padding(
              padding: EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  selectScreen(3, context);
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: _primaryColor,
                  child: FaIcon(
                    FontAwesomeIcons.handScissors,
                    size: 50,
                    color: _bgColor,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
