// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpscissors/screens/rulesScreen.dart';

import 'homeScreen.dart';

class WinOrLoseScreen extends StatefulWidget {
  late int opponentHand;
  late int playerHand;
  WinOrLoseScreen({required this.opponentHand, required this.playerHand});

  @override
  State<WinOrLoseScreen> createState() => _WinOrLoseScreenState();
}

class _WinOrLoseScreenState extends State<WinOrLoseScreen> {
  @override
  late String _text;
  Color _bgColor = Colors.black;
  Color _primaryColor = Colors.white;
  void initState() {
    super.initState();

    if (widget.opponentHand == widget.playerHand) {
      draw();
    } else if (widget.opponentHand - widget.playerHand == 2 ||
        widget.opponentHand - widget.playerHand == -2) {
      loss();
    } else if (widget.opponentHand - widget.playerHand == -1) {
      win();
    } else if (widget.opponentHand == 2) {
      loss();
    } else {
      win();
    }
  }

  void draw() {
    setState(() {
      _text = 'draw';
    });
  }

  void loss() {
    setState(() {
      _text = 'you lose';
    });
  }

  void win() {
    setState(() {
      _text = 'you win';
      _bgColor = Colors.white;
      _primaryColor = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text(_text.toUpperCase(),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 80,
                    color: _primaryColor)),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RulesScreen()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: _primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
                    child:
                        Text('Play Again', style: TextStyle(color: _bgColor)),
                  ))),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: _primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(140, 20, 140, 20),
                    child: Text('Exit', style: TextStyle(color: _bgColor)),
                  )))
        ]),
      ),
    );
  }
}
