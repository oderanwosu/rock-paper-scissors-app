import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rpscissors/screens/rulesscreen.dart';

class OpponentSelectionScreen extends StatefulWidget {
  OpponentSelectionScreen({Key? key}) : super(key: key);

  @override
  State<OpponentSelectionScreen> createState() =>
      _OpponentSelectionScreenState();
}

class _OpponentSelectionScreenState extends State<OpponentSelectionScreen> {
  int _current = 0;
  List<Widget> screenList = [
    CPUOpponentSelectionWidget(),
    TwoPlayerOpponentSelectionScreen()
  ];
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                  child: CarouselSlider(
                items: screenList,
                carouselController: _controller,
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: screenList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
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
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(120, 20, 120, 20),
                        child: Text('play'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      )))
            ],
          ),
        ));
  }
}

class CPUOpponentSelectionWidget extends StatelessWidget {
  const CPUOpponentSelectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CPU Opponent'.toUpperCase(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          FaIcon(
            FontAwesomeIcons.robot,
            size: 90,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'beebot... boo.'.toLowerCase(),
          ),
        ],
      ),
    );
  }
}

class TwoPlayerOpponentSelectionScreen extends StatelessWidget {
  const TwoPlayerOpponentSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('2 Player'.toUpperCase(),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        SizedBox(
          height: 10,
        ),
        FaIcon(
          FontAwesomeIcons.faceGrinWink,
          size: 90,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Play with a friend.'.toLowerCase(),
        ),
      ],
    );
  }
}
