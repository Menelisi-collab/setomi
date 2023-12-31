import 'dart:async';

import 'package:flutter/material.dart';
import 'package:setomi/custom_square.dart';
import 'package:setomi/custom_square_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 11;

  late Timer timer;

  @override
  initState(){
    super.initState();
    timer = Timer.periodic(Duration(seconds: 12), (timer) {
      setState(() {
        customSquares.shuffle();
      });
    });
  }

  @override
  void dispose() {
    if (timer != null) timer.cancel();
    super.dispose();
  }



  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Column(
          children: [
            Container(
              child: Container(
                child: Expanded(
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: customSquares.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: numberInRow),
                      itemBuilder: (BuildContext context, int index) {

                        final currentNumber = customSquares[index];

                        return Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: CustomSquare(value: currentNumber),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            _PlayButton(),
          ],
        ),
      ),
    );
  }}


class _PlayButton extends StatefulWidget{
  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<_PlayButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ElevatedButton( style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightGreenAccent),
        elevation: MaterialStateProperty.all(8),
        side: MaterialStateProperty.all<BorderSide>(const BorderSide(width: 1, style: BorderStyle.solid))),
          onPressed: () {},
        child: Text("PLAY"),),
      ),
    );}
}